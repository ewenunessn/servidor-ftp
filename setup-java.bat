@echo off
echo ========================================
echo  Configurador de Java - FTP Server
echo ========================================
echo.

echo 1. Verificando instalacoes Java existentes...
echo.

if exist "C:\Program Files\Java\jre1.8.0_461" (
    echo [ENCONTRADO] JRE 8 em: C:\Program Files\Java\jre1.8.0_461
    set "JRE_PATH=C:\Program Files\Java\jre1.8.0_461"
)

echo.
echo 2. Procurando JDK...
for /d %%i in ("C:\Program Files\Java\jdk*") do (
    echo [ENCONTRADO] JDK em: %%i
    set "JDK_PATH=%%i"
    goto :found_jdk
)

for /d %%i in ("C:\Program Files\Eclipse Adoptium\jdk*") do (
    echo [ENCONTRADO] JDK em: %%i
    set "JDK_PATH=%%i"
    goto :found_jdk
)

for /d %%i in ("C:\Program Files\OpenJDK\jdk*") do (
    echo [ENCONTRADO] JDK em: %%i
    set "JDK_PATH=%%i"
    goto :found_jdk
)

echo [AVISO] JDK nao encontrado!
echo.
echo O JRE sozinho nao e suficiente para desenvolvimento Android.
echo Voce precisa instalar o JDK (Java Development Kit).
echo.
echo Opcoes recomendadas:
echo 1. Eclipse Temurin JDK 11: https://adoptium.net/temurin/releases/
echo 2. Oracle JDK 11: https://www.oracle.com/java/technologies/downloads/
echo.
echo Apos instalar o JDK, execute este script novamente.
echo.
pause
exit /b 1

:found_jdk
echo [OK] JDK encontrado em: %JDK_PATH%
echo.

echo 3. Configurando variaveis de ambiente...
echo.

echo Definindo JAVA_HOME...
setx JAVA_HOME "%JDK_PATH%" /M 2>nul
if %errorlevel% neq 0 (
    echo [AVISO] Nao foi possivel definir JAVA_HOME globalmente.
    echo Execute como Administrador para configuracao global.
    echo.
    echo Configurando para a sessao atual...
    set "JAVA_HOME=%JDK_PATH%"
) else (
    echo [OK] JAVA_HOME definido globalmente: %JDK_PATH%
    set "JAVA_HOME=%JDK_PATH%"
)

echo.
echo Adicionando Java ao PATH...
set "NEW_PATH=%JAVA_HOME%\bin"
echo %PATH% | find /i "%NEW_PATH%" >nul
if %errorlevel% neq 0 (
    setx PATH "%PATH%;%NEW_PATH%" /M 2>nul
    if %errorlevel% neq 0 (
        echo [AVISO] Nao foi possivel atualizar PATH globalmente.
        echo Configurando para a sessao atual...
        set "PATH=%PATH%;%NEW_PATH%"
    ) else (
        echo [OK] PATH atualizado globalmente
        set "PATH=%PATH%;%NEW_PATH%"
    )
) else (
    echo [OK] Java ja esta no PATH
)

echo.
echo 4. Testando configuracao...
echo.
"%JAVA_HOME%\bin\java" -version
if %errorlevel% neq 0 (
    echo [ERRO] Falha ao executar Java
    pause
    exit /b 1
)

echo.
echo 5. Testando javac (compilador)...
"%JAVA_HOME%\bin\javac" -version
if %errorlevel% neq 0 (
    echo [ERRO] Compilador Java nao encontrado
    echo Certifique-se de ter instalado o JDK, nao apenas o JRE
    pause
    exit /b 1
)

echo.
echo ========================================
echo  CONFIGURACAO CONCLUIDA COM SUCESSO!
echo ========================================
echo.
echo JAVA_HOME: %JAVA_HOME%
echo.
echo Para aplicar as mudancas:
echo 1. Feche e reabra o terminal/prompt
echo 2. Ou reinicie o computador
echo.
echo Agora voce pode compilar o projeto Android:
echo - gradlew.bat assembleDebug
echo.
pause