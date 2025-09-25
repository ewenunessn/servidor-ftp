@echo off
echo ========================================
echo  Configurando Java 17 para Android
echo ========================================
echo.

echo O Java 25 e muito novo para desenvolvimento Android.
echo Vamos baixar e usar o Java 17 LTS (recomendado).
echo.

set /p confirm="Deseja baixar Java 17 LTS? (S/N): "
if /i not "%confirm%"=="S" (
    echo Operacao cancelada.
    pause
    exit /b 0
)

echo.
echo Baixando Eclipse Temurin JDK 17...

set "JDK17_URL=https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.8.1%%2B1/OpenJDK17U-jdk_x64_windows_hotspot_17.0.8.1_1.msi"
set "JDK17_FILE=OpenJDK17U-jdk_x64_windows_hotspot_17.0.8.1_1.msi"

powershell -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%JDK17_URL%' -OutFile '%JDK17_FILE%' -UseBasicParsing}"

if not exist "%JDK17_FILE%" (
    echo [ERRO] Falha no download
    echo.
    echo Baixe manualmente de: https://adoptium.net/temurin/releases/
    echo Escolha: JDK 17 (LTS) para Windows x64
    pause
    exit /b 1
)

echo.
echo Instalando Java 17...
start /wait msiexec /i "%JDK17_FILE%" /quiet ADDLOCAL=FeatureMain,FeatureEnvironment,FeatureJarFileRunWith,FeatureJavaHome

echo.
echo Configurando variaveis para Java 17...
for /d %%i in ("C:\Program Files\Eclipse Adoptium\jdk-17*") do (
    set "JAVA17_HOME=%%i"
    goto :found
)

:found
if not defined JAVA17_HOME (
    echo [ERRO] Java 17 nao encontrado apos instalacao
    pause
    exit /b 1
)

echo JAVA_HOME configurado para: %JAVA17_HOME%
set "JAVA_HOME=%JAVA17_HOME%"
set "PATH=%JAVA17_HOME%\bin;%PATH%"

echo.
echo Testando Java 17...
java -version

echo.
echo Limpando arquivo temporario...
del "%JDK17_FILE%" 2>nul

echo.
echo ========================================
echo  Java 17 configurado com sucesso!
echo ========================================
echo.
echo Agora voce pode compilar o projeto:
echo gradlew.bat assembleDebug
echo.
pause