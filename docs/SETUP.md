# 🛠️ Guia de Configuração - FTP Server Android

Este guia te ajudará a configurar o ambiente de desenvolvimento e compilar o projeto.

## 📋 Pré-requisitos

### 1. Java Development Kit (JDK)
- **Versão**: JDK 11 ou superior (recomendado: JDK 17 LTS)
- **Download**: [Eclipse Temurin](https://adoptium.net/) ou [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)

#### Instalação Windows:
```bash
# Baixe e execute o instalador
# Configure as variáveis de ambiente:
JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-17.x.x
PATH=%JAVA_HOME%\bin;%PATH%
```

#### Verificação:
```bash
java -version
javac -version
```

### 2. Android Studio
- **Download**: [Android Studio](https://developer.android.com/studio)
- **Componentes necessários**:
  - Android SDK
  - Android SDK Platform-Tools
  - Android SDK Build-Tools
  - Android Emulator (opcional)

#### Configuração:
1. Abra o Android Studio
2. **File** → **Settings** → **Appearance & Behavior** → **System Settings** → **Android SDK**
3. Instale pelo menos **Android 5.0 (API 21)** até **Android 14 (API 34)**

### 3. Git
- **Download**: [Git](https://git-scm.com/downloads)
- Configure suas credenciais:
```bash
git config --global user.name "Seu Nome"
git config --global user.email "seu.email@exemplo.com"
```

## 🚀 Configuração do Projeto

### 1. Clone o Repositório
```bash
git clone https://github.com/seu-usuario/ftp-server-android.git
cd ftp-server-android
```

### 2. Configuração no Android Studio

#### Abrir o Projeto:
1. **File** → **Open**
2. Selecione a pasta do projeto
3. Aguarde a sincronização do Gradle

#### Configurar SDK:
1. **File** → **Project Structure**
2. **Project Settings** → **Project**
3. Configure:
   - **Project SDK**: Android API 34
   - **Project language level**: 8 - Lambdas, type annotations etc.

#### Configurar Dispositivo:
1. **Tools** → **AVD Manager** (para emulador)
2. Ou conecte um dispositivo físico via USB

### 3. Compilação via Linha de Comando

#### Windows:
```bash
# Navegar para a pasta do projeto
cd ftp-server-android

# Compilar
gradlew.bat assembleDebug

# Instalar (com dispositivo conectado)
gradlew.bat installDebug
```

#### Linux/Mac:
```bash
# Navegar para a pasta do projeto
cd ftp-server-android

# Dar permissão de execução
chmod +x gradlew

# Compilar
./gradlew assembleDebug

# Instalar (com dispositivo conectado)
./gradlew installDebug
```

## 📱 Configuração do Dispositivo

### Dispositivo Físico:

#### 1. Ativar Modo Desenvolvedor:
- **Configurações** → **Sobre o telefone**
- Toque **7 vezes** em "Número da versão"

#### 2. Ativar Depuração USB:
- **Configurações** → **Opções do desenvolvedor**
- Ative **"Depuração USB"**

#### 3. Conectar e Autorizar:
- Conecte via USB
- Autorize a depuração no dispositivo
- Verifique: `adb devices`

### Emulador Android:

#### 1. Criar AVD:
- **Tools** → **AVD Manager** → **Create Virtual Device**
- Escolha um dispositivo (ex: Pixel 4)
- Selecione uma imagem do sistema (API 21+)

#### 2. Configurações Recomendadas:
- **RAM**: 2048 MB ou mais
- **Storage**: 2 GB ou mais
- **Graphics**: Hardware - GLES 2.0

## 🔧 Solução de Problemas

### Erro: "SDK not found"
```bash
# Configurar ANDROID_HOME
# Windows:
set ANDROID_HOME=C:\Users\%USERNAME%\AppData\Local\Android\Sdk
set PATH=%ANDROID_HOME%\platform-tools;%PATH%

# Linux/Mac:
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

### Erro: "Java version incompatible"
- Verifique se está usando JDK 11+
- Configure JAVA_HOME corretamente
- Reinicie o Android Studio

### Erro: "Gradle sync failed"
1. **File** → **Invalidate Caches and Restart**
2. Verifique conexão com internet
3. Tente: **Build** → **Clean Project**

### Erro: "Device not found"
```bash
# Verificar dispositivos conectados
adb devices

# Reiniciar ADB se necessário
adb kill-server
adb start-server
```

## 📊 Verificação da Instalação

### 1. Compilação Bem-sucedida:
- ✅ Gradle sync sem erros
- ✅ Build successful
- ✅ APK gerado em `app/build/outputs/apk/debug/`

### 2. Instalação no Dispositivo:
- ✅ App aparece na lista de aplicativos
- ✅ Ícone do servidor FTP visível
- ✅ App abre sem crashes

### 3. Funcionalidade Básica:
- ✅ Interface carrega corretamente
- ✅ Botões respondem ao toque
- ✅ Permissões são solicitadas
- ✅ IP do dispositivo é exibido

## 🎯 Próximos Passos

Após a configuração bem-sucedida:

1. **Explore o código** - Entenda a estrutura do projeto
2. **Teste funcionalidades** - Inicie o servidor e teste conexões FTP
3. **Faça modificações** - Experimente pequenas mudanças
4. **Contribua** - Veja [CONTRIBUTING.md](../CONTRIBUTING.md) para diretrizes

## 📞 Suporte

Se encontrar problemas:
1. Verifique este guia novamente
2. Consulte a [documentação oficial do Android](https://developer.android.com/docs)
3. Abra uma [issue](../../issues) com detalhes do problema

Boa sorte com o desenvolvimento! 🚀