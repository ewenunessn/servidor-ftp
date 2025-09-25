@echo off
echo ========================================
echo  Download JDK - FTP Server
echo ========================================
echo.

echo Este script ira baixar e instalar o Eclipse Temurin JDK 11
echo (OpenJDK gratuito e recomendado para desenvolvimento Android)
echo.
set /p confirm="Deseja continuar? (S/N): "
if /i not "%confirm%"=="S" (
    echo Operacao cancelada.
    pause
    exit /b 0
)

echo.
echo Detectando arquitetura do sistema...
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
    set "ARCH=x64"
    set "JDK_URL=https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.20.1%2B1/OpenJDK11U-jdk_x64_windows_hotspot_11.0.20.1_1.msi"
    set "JDK_FILE=OpenJDK11U-jdk_x64_windows_hotspot_11.0.20.1_1.msi"
) else (
    set "ARCH=x86"
    set "JDK_URL=https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.20.1%2B1/OpenJDK11U-jdk_x86-32_windows_hotspot_11.0.20.1_1.msi"
    set "JDK_FILE=OpenJDK11U-jdk_x86-32_windows_hotspot_11.0.20.1_1.msi"
)

echo Arquitetura detectada: %ARCH%
echo.

echo Baixando JDK 11...
echo URL: %JDK_URL%
echo.

powershell -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%JDK_URL%' -OutFile '%JDK_FILE%' -UseBasicParsing}"

if not exist "%JDK_FILE%" (
    echo [ERRO] Falha no download do JDK
    echo.
    echo Por favor, baixe manualmente de: https://adoptium.net/temurin/releases/
    echo Escolha: JDK 11 (LTS) para Windows %ARCH%
    echo.
    pause
    exit /b 1
)

echo.
echo [OK] Download concluido: %JDK_FILE%
echo.
echo Iniciando instalacao...
echo IMPORTANTE: Durante a instalacao, marque a opcao "Set JAVA_HOME variable"
echo.
pause

start /wait msiexec /i "%JDK_FILE%" /quiet ADDLOCAL=FeatureMain,FeatureEnvironment,FeatureJarFileRunWith,FeatureJavaHome

if %errorlevel% neq 0 (
    echo [ERRO] Falha na instalacao automatica
    echo.
    echo Tentando instalacao manual...
    start "%JDK_FILE%"
    echo.
    echo Apos a instalacao manual:
    echo 1. Execute setup-java.bat para configurar as variaveis
    echo 2. Ou reinicie o computador
    echo.
    pause
    exit /b 1
)

echo.
echo [OK] JDK instalado com sucesso!
echo.
echo Limpando arquivo temporario...
del "%JDK_FILE%" 2>nul

echo.
echo Executando configuracao automatica...
call setup-java.bat

echo.
echo ========================================
echo  INSTALACAO CONCLUIDA!
echo ========================================
echo.
echo O JDK 11 foi instalado e configurado.
echo Reinicie o terminal ou computador para aplicar as mudancas.
echo.
pause