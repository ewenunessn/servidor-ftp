@echo off
echo ========================================
echo  Upload para GitHub - Servidor FTP
echo  Repositorio: ewenunessn/servidor-ftp
echo ========================================
echo.

echo 1. Verificando se Git esta inicializado...
if not exist ".git" (
    echo Inicializando repositorio Git...
    git init
    git branch -M main
)

echo.
echo 2. Adicionando todos os arquivos...
git add .

echo.
echo 3. Verificando status...
git status

echo.
echo 4. Fazendo commit...
git commit -m "feat: servidor FTP Android completo

✨ Funcionalidades implementadas:
- 🚀 Servidor FTP nativo completo
- 🎨 Interface Material Design moderna  
- ⚙️ Configuracao flexivel (porta, usuario, senha)
- 📁 Compartilhamento da pasta Downloads
- 🌐 Deteccao automatica do IP do dispositivo
- 📊 Status do servidor em tempo real
- 🔒 Sistema de autenticacao robusto
- 📱 Suporte Android 5.0+ (API 21)

🛠️ Recursos incluidos:
- Codigo fonte completo do app Android
- Scripts de configuracao e instalacao
- Documentacao completa (README, SETUP, CONTRIBUTING)
- Licenca MIT para uso livre
- Estrutura profissional de projeto open source

🎯 Como usar:
1. Compile o projeto no Android Studio
2. Instale o APK no dispositivo Android
3. Configure porta, usuario e senha
4. Inicie o servidor FTP
5. Conecte de qualquer cliente FTP usando o IP mostrado

Projeto pronto para producao e contribuicoes da comunidade!"

echo.
echo 5. Configurando repositorio remoto...
git remote remove origin 2>nul
git remote add origin https://github.com/ewenunessn/servidor-ftp.git

echo.
echo 6. Fazendo push para o GitHub...
echo Enviando arquivos para: https://github.com/ewenunessn/servidor-ftp.git
echo.
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo  ✅ UPLOAD CONCLUIDO COM SUCESSO!
    echo ========================================
    echo.
    echo 🎉 Projeto enviado para:
    echo 🔗 https://github.com/ewenunessn/servidor-ftp
    echo.
    echo 📋 Proximos passos recomendados:
    echo.
    echo 1. Acesse o repositorio no GitHub
    echo 2. Verifique se todos os arquivos foram enviados
    echo 3. Edite a descricao do repositorio:
    echo    "📱 Servidor FTP completo para Android"
    echo.
    echo 4. Adicione topics:
    echo    android, ftp, server, java, mobile, file-transfer
    echo.
    echo 5. Compile o APK e crie uma release:
    echo    gradlew.bat assembleRelease
    echo.
    echo 6. Compartilhe o projeto com a comunidade!
    echo.
) else (
    echo.
    echo ========================================
    echo  ❌ ERRO NO UPLOAD
    echo ========================================
    echo.
    echo Possiveis causas:
    echo - Credenciais do Git nao configuradas
    echo - Repositorio nao existe ou sem permissao
    echo - Problemas de conexao com internet
    echo.
    echo Solucoes:
    echo 1. Configure suas credenciais:
    echo    git config --global user.name "Seu Nome"
    echo    git config --global user.email "seu.email@exemplo.com"
    echo.
    echo 2. Faca login no GitHub via navegador
    echo.
    echo 3. Tente novamente ou use o GitHub Desktop
    echo.
)

echo.
pause