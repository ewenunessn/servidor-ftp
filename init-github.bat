@echo off
echo ========================================
echo  Inicializando Repositorio GitHub
echo  FTP Server Android
echo ========================================
echo.

echo 1. Inicializando repositorio Git...
git init
if %errorlevel% neq 0 (
    echo [ERRO] Falha ao inicializar Git
    echo Certifique-se de que o Git esta instalado
    pause
    exit /b 1
)

echo.
echo 2. Adicionando arquivos ao staging...
git add .
git status

echo.
echo 3. Fazendo commit inicial...
git commit -m "feat: implementacao inicial do servidor FTP Android

- Servidor FTP completo com implementacao nativa
- Interface Material Design moderna
- Configuracao flexivel de porta, usuario e senha
- Compartilhamento da pasta Downloads
- Deteccao automatica do IP do dispositivo
- Sistema de autenticacao robusto
- Suporte para Android 5.0+ (API 21)
- Documentacao completa do projeto"

echo.
echo 4. Configurando branch principal...
git branch -M main

echo.
echo ========================================
echo  REPOSITORIO PREPARADO COM SUCESSO!
echo ========================================
echo.
echo Proximos passos:
echo.
echo 1. Crie um repositorio no GitHub:
echo    https://github.com/new
echo.
echo 2. Execute os comandos:
echo    git remote add origin https://github.com/ewenunessn/servidor-ftp.git
echo    git push -u origin main
echo.
echo 3. Ou execute o script automatico: upload-to-github.bat
echo.
echo Arquivos incluidos:
echo - Codigo fonte completo do app Android
echo - Scripts de configuracao (.bat)
echo - Documentacao (README, SETUP, CONTRIBUTING)
echo - Licenca MIT
echo - .gitignore configurado
echo - CHANGELOG.md
echo.
pause