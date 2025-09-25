# 🚀 Como Compilar o App FTP Server - MÉTODO FÁCIL

## Opção 1: Android Studio (RECOMENDADO) ⭐

### 1. Baixar Android Studio
- Acesse: https://developer.android.com/studio
- Baixe e instale o Android Studio
- Durante a instalação, marque "Android SDK" e "Android Virtual Device"

### 2. Abrir o Projeto
1. Abra o Android Studio
2. Clique em "Open an existing project"
3. Navegue até esta pasta do projeto
4. Clique em "OK"

### 3. Aguardar Sincronização
- O Android Studio vai baixar automaticamente:
  - Gradle correto
  - Android SDK
  - Dependências do projeto
- Aguarde a mensagem "Gradle sync finished"

### 4. Compilar o APK
1. No menu: **Build** → **Build Bundle(s) / APK(s)** → **Build APK(s)**
2. Aguarde a compilação
3. Clique em "locate" quando aparecer a notificação
4. O APK estará em: `app/build/outputs/apk/debug/app-debug.apk`

---

## Opção 2: Linha de Comando (Para Experts) 🔧

### Pré-requisitos
- Java 17 LTS (não Java 25)
- Android SDK configurado
- Variáveis de ambiente: JAVA_HOME, ANDROID_HOME

### Comandos
```bash
# Windows
gradlew.bat assembleDebug

# Linux/Mac  
./gradlew assembleDebug
```

---

## 📱 Instalar no Celular

### 1. Preparar o Dispositivo
1. Vá em **Configurações** → **Sobre o telefone**
2. Toque 7 vezes em "Número da versão" para ativar modo desenvolvedor
3. Volte em **Configurações** → **Opções do desenvolvedor**
4. Ative **"Depuração USB"**

### 2. Conectar e Instalar
1. Conecte o celular no PC via USB
2. Autorize a depuração USB no celular
3. Execute um dos comandos:

```bash
# Via Android Studio
# Build → Select Device → Run

# Via linha de comando
adb install app/build/outputs/apk/debug/app-debug.apk
```

---

## ⚡ Solução de Problemas

### "Java não encontrado"
- Use o Android Studio (já tem Java integrado)
- Ou execute: `use-java17.bat`

### "Gradle sync failed"
- Verifique conexão com internet
- No Android Studio: File → Invalidate Caches → Restart

### "SDK not found"
- No Android Studio: File → Project Structure → SDK Location
- Configure o caminho do Android SDK

---

## 🎯 Resultado Final

Após a compilação, você terá:
- **APK**: `app/build/outputs/apk/debug/app-debug.apk`
- **Tamanho**: ~5-10 MB
- **Funcionalidades**: Servidor FTP completo para Android

### Como usar o app:
1. Instale o APK no celular
2. Abra o app "Servidor FTP"
3. Configure porta, usuário e senha
4. Toque em "Iniciar Servidor"
5. Conecte de outro dispositivo usando o IP mostrado

**Exemplo de conexão:**
- Servidor: 192.168.1.100
- Porta: 2121
- Usuário: admin
- Senha: admin

---

## 📞 Suporte

Se tiver problemas:
1. Use o **Android Studio** (método mais fácil)
2. Verifique se tem **internet** para baixar dependências
3. Certifique-se que o **celular está em modo desenvolvedor**

**Boa sorte! 🍀**