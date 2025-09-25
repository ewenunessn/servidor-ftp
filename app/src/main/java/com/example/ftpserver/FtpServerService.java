package com.example.ftpserver;

import android.app.Service;
import android.content.Intent;
import android.os.Environment;
import android.os.IBinder;
import android.util.Log;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class FtpServerService extends Service {
    private static final String TAG = "FtpServerService";
    private ServerSocket serverSocket;
    private ExecutorService executorService;
    private boolean isRunning = false;
    private String username;
    private String password;
    private File rootDirectory;

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (intent != null) {
            String action = intent.getAction();
            
            if ("START_SERVER".equals(action)) {
                int port = intent.getIntExtra("port", 2121);
                username = intent.getStringExtra("username");
                password = intent.getStringExtra("password");
                
                startFtpServer(port);
            } else if ("STOP_SERVER".equals(action)) {
                stopFtpServer();
            }
        }
        
        return START_STICKY;
    }

    private void startFtpServer(int port) {
        try {
            // Configurar diretório raiz
            rootDirectory = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
            if (!rootDirectory.exists()) {
                rootDirectory.mkdirs();
            }
            
            serverSocket = new ServerSocket(port);
            isRunning = true;
            executorService = Executors.newCachedThreadPool();
            
            Log.d(TAG, "Servidor FTP iniciado na porta " + port);
            
            // Thread para aceitar conexões
            new Thread(() -> {
                while (isRunning && !serverSocket.isClosed()) {
                    try {
                        Socket clientSocket = serverSocket.accept();
                        executorService.execute(new FtpClientHandler(clientSocket));
                    } catch (IOException e) {
                        if (isRunning) {
                            Log.e(TAG, "Erro ao aceitar conexão", e);
                        }
                    }
                }
            }).start();
            
        } catch (IOException e) {
            Log.e(TAG, "Erro ao iniciar servidor FTP", e);
        }
    }

    private void stopFtpServer() {
        isRunning = false;
        try {
            if (serverSocket != null && !serverSocket.isClosed()) {
                serverSocket.close();
            }
            if (executorService != null) {
                executorService.shutdown();
            }
            Log.d(TAG, "Servidor FTP parado");
        } catch (IOException e) {
            Log.e(TAG, "Erro ao parar servidor", e);
        }
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        stopFtpServer();
    }

    private class FtpClientHandler implements Runnable {
        private Socket controlSocket;
        private BufferedReader reader;
        private BufferedWriter writer;
        private boolean authenticated = false;
        private File currentDirectory;

        public FtpClientHandler(Socket socket) {
            this.controlSocket = socket;
            this.currentDirectory = rootDirectory;
        }

        @Override
        public void run() {
            try {
                reader = new BufferedReader(new InputStreamReader(controlSocket.getInputStream()));
                writer = new BufferedWriter(new OutputStreamWriter(controlSocket.getOutputStream()));
                
                // Enviar mensagem de boas-vindas
                sendResponse("220 Servidor FTP Android pronto");
                
                String command;
                while ((command = reader.readLine()) != null && !controlSocket.isClosed()) {
                    processCommand(command.trim());
                }
                
            } catch (IOException e) {
                Log.e(TAG, "Erro na conexão do cliente", e);
            } finally {
                try {
                    if (controlSocket != null) controlSocket.close();
                } catch (IOException e) {
                    Log.e(TAG, "Erro ao fechar conexão", e);
                }
            }
        }

        private void processCommand(String command) throws IOException {
            String[] parts = command.split(" ", 2);
            String cmd = parts[0].toUpperCase();
            String args = parts.length > 1 ? parts[1] : "";

            Log.d(TAG, "Comando recebido: " + command);

            switch (cmd) {
                case "USER":
                    if (args.equals(username)) {
                        sendResponse("331 Usuário OK, senha necessária");
                    } else {
                        sendResponse("530 Usuário inválido");
                    }
                    break;
                    
                case "PASS":
                    if (args.equals(password)) {
                        authenticated = true;
                        sendResponse("230 Login bem-sucedido");
                    } else {
                        sendResponse("530 Senha incorreta");
                    }
                    break;
                    
                case "PWD":
                    if (authenticated) {
                        sendResponse("257 \"" + getRelativePath(currentDirectory) + "\" é o diretório atual");
                    } else {
                        sendResponse("530 Não autenticado");
                    }
                    break;
                    
                case "LIST":
                    if (authenticated) {
                        listFiles();
                    } else {
                        sendResponse("530 Não autenticado");
                    }
                    break;
                    
                case "TYPE":
                    sendResponse("200 Tipo definido para " + args);
                    break;
                    
                case "PASV":
                    sendResponse("227 Modo passivo não suportado, use modo ativo");
                    break;
                    
                case "QUIT":
                    sendResponse("221 Tchau");
                    controlSocket.close();
                    break;
                    
                default:
                    sendResponse("502 Comando não implementado");
                    break;
            }
        }

        private void sendResponse(String response) throws IOException {
            writer.write(response + "\r\n");
            writer.flush();
            Log.d(TAG, "Resposta enviada: " + response);
        }

        private void listFiles() throws IOException {
            sendResponse("150 Listando arquivos");
            
            File[] files = currentDirectory.listFiles();
            if (files != null) {
                for (File file : files) {
                    String permissions = file.isDirectory() ? "drwxrwxrwx" : "-rw-rw-rw-";
                    String size = String.valueOf(file.length());
                    String name = file.getName();
                    String listing = permissions + " 1 owner group " + size + " Jan 01 12:00 " + name;
                    sendResponse(listing);
                }
            }
            
            sendResponse("226 Listagem completa");
        }

        private String getRelativePath(File file) {
            String rootPath = rootDirectory.getAbsolutePath();
            String filePath = file.getAbsolutePath();
            
            if (filePath.startsWith(rootPath)) {
                String relative = filePath.substring(rootPath.length());
                return relative.isEmpty() ? "/" : relative.replace(File.separator, "/");
            }
            return "/";
        }
    }
}