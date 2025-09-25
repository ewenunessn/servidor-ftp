package com.example.ftpserver;

import android.Manifest;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.text.format.Formatter;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

public class MainActivity extends AppCompatActivity {
    private static final int PERMISSION_REQUEST_CODE = 1;
    
    private Button btnStartServer, btnStopServer;
    private EditText etPort, etUsername, etPassword;
    private TextView tvStatus, tvIpAddress;
    private boolean isServerRunning = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        initViews();
        checkPermissions();
        displayIpAddress();
        setupClickListeners();
    }

    private void initViews() {
        btnStartServer = findViewById(R.id.btnStartServer);
        btnStopServer = findViewById(R.id.btnStopServer);
        etPort = findViewById(R.id.etPort);
        etUsername = findViewById(R.id.etUsername);
        etPassword = findViewById(R.id.etPassword);
        tvStatus = findViewById(R.id.tvStatus);
        tvIpAddress = findViewById(R.id.tvIpAddress);
        
        // Valores padrão
        etPort.setText("2121");
        etUsername.setText("admin");
        etPassword.setText("admin");
        
        updateUI();
    }

    private void checkPermissions() {
        String[] permissions = {
            Manifest.permission.READ_EXTERNAL_STORAGE,
            Manifest.permission.WRITE_EXTERNAL_STORAGE,
            Manifest.permission.INTERNET,
            Manifest.permission.ACCESS_NETWORK_STATE,
            Manifest.permission.ACCESS_WIFI_STATE
        };
        
        boolean allGranted = true;
        for (String permission : permissions) {
            if (ContextCompat.checkSelfPermission(this, permission) != PackageManager.PERMISSION_GRANTED) {
                allGranted = false;
                break;
            }
        }
        
        if (!allGranted) {
            ActivityCompat.requestPermissions(this, permissions, PERMISSION_REQUEST_CODE);
        }
    }

    private void displayIpAddress() {
        try {
            WifiManager wifiManager = (WifiManager) getApplicationContext().getSystemService(WIFI_SERVICE);
            if (wifiManager != null) {
                int ipAddress = wifiManager.getConnectionInfo().getIpAddress();
                String ip = Formatter.formatIpAddress(ipAddress);
                if (ip != null && !ip.equals("0.0.0.0")) {
                    tvIpAddress.setText("IP do Servidor: " + ip);
                } else {
                    tvIpAddress.setText("IP do Servidor: Não disponível (conecte ao Wi-Fi)");
                }
            } else {
                tvIpAddress.setText("IP do Servidor: Não disponível");
            }
        } catch (SecurityException e) {
            tvIpAddress.setText("IP do Servidor: Permissão negada");
        } catch (Exception e) {
            tvIpAddress.setText("IP do Servidor: Erro ao obter IP");
        }
    }

    private void setupClickListeners() {
        btnStartServer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startFtpServer();
            }
        });

        btnStopServer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                stopFtpServer();
            }
        });
    }

    private void startFtpServer() {
        String port = etPort.getText().toString().trim();
        String username = etUsername.getText().toString().trim();
        String password = etPassword.getText().toString().trim();
        
        if (port.isEmpty() || username.isEmpty() || password.isEmpty()) {
            Toast.makeText(this, "Preencha todos os campos", Toast.LENGTH_SHORT).show();
            return;
        }
        
        Intent serviceIntent = new Intent(this, FtpServerService.class);
        serviceIntent.putExtra("port", Integer.parseInt(port));
        serviceIntent.putExtra("username", username);
        serviceIntent.putExtra("password", password);
        serviceIntent.setAction("START_SERVER");
        
        startService(serviceIntent);
        isServerRunning = true;
        updateUI();
        
        Toast.makeText(this, "Servidor FTP iniciado na porta " + port, Toast.LENGTH_SHORT).show();
    }

    private void stopFtpServer() {
        Intent serviceIntent = new Intent(this, FtpServerService.class);
        serviceIntent.setAction("STOP_SERVER");
        startService(serviceIntent);
        
        isServerRunning = false;
        updateUI();
        
        Toast.makeText(this, "Servidor FTP parado", Toast.LENGTH_SHORT).show();
    }

    private void updateUI() {
        if (isServerRunning) {
            btnStartServer.setEnabled(false);
            btnStopServer.setEnabled(true);
            tvStatus.setText("Status: Servidor Ativo");
            tvStatus.setTextColor(getResources().getColor(android.R.color.holo_green_dark));
        } else {
            btnStartServer.setEnabled(true);
            btnStopServer.setEnabled(false);
            tvStatus.setText("Status: Servidor Inativo");
            tvStatus.setTextColor(getResources().getColor(android.R.color.holo_red_dark));
        }
    }
}