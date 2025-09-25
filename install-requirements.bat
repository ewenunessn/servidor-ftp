@echo off
echo ========================================
echo  Instalador de Requisitos - FTP Server
echo ========================================
echo.

echo 1. Verificando Java...
java -version 2>nul
if %errorlevel% neq 0 (
    echo [ERRO] Java nao encontrado!
    echo.
    echo Por favor, instale o Java JDK 11 ou superior:
    echo - Oracle JDK: https://www.oracle.com/java/technologies/downloads/
    echo - OpenJDK: https://adoptium.net/
    echo.
    echo Apos a instalacao, configure as variaveis de ambiente:
    echo - JAVA_HOME = caminho para o JDK
    echo - PATH = adicione %%JAVA_HOME%%\bin
    echo.
    pause
    exit /b 1
) else (
    echo [OK] Java encontrado!
)

echo.
echo 2. Verificando Android SDK...
if not exist "%ANDROID_HOME%" (
    echo [AVISO] ANDROID_HOME nao configurado
    echo.
    echo Instale o Android Studio e configure:
    echo - ANDROID_HOME = caminho para o SDK
    echo - PATH = adicione %%ANDROID_HOME%%\platform-tools
    echo.
) else (
    echo [OK] Android SDK configurado!
)

echo.
echo 3. Para compilar o projeto:
echo    - Abra o Android Studio
echo    - Ou execute: gradlew.bat assembleDebug
echo.
echo 4. Para instalar no dispositivo:
echo    - Ative "Depuracao USB" no Android
echo    - Execute: adb install app\build\outputs\apk\debug\app-debug.apk
echo.
pause