# 🚀 Como Enviar para o GitHub

Este guia te ajudará a criar um repositório no GitHub e fazer o upload do projeto.

## 📋 Pré-requisitos

- ✅ Conta no GitHub
- ✅ Git instalado no computador
- ✅ Projeto compilando sem erros

## 🎯 Opção 1: GitHub CLI (Mais Fácil)

### 1. Instalar GitHub CLI
- **Windows**: Baixe de https://cli.github.com/
- **Linux**: `sudo apt install gh`
- **Mac**: `brew install gh`

### 2. Fazer Login
```bash
gh auth login
```

### 3. Criar e Enviar Repositório
```bash
# Execute o script de inicialização
init-github.bat

# Criar repositório e fazer push
gh repo create ftp-server-android --public --push
```

## 🔧 Opção 2: Interface Web do GitHub

### 1. Criar Repositório no GitHub
1. Acesse https://github.com/new
2. **Repository name**: `ftp-server-android`
3. **Description**: `📱 Servidor FTP completo para Android - Transforme seu dispositivo em um servidor FTP!`
4. Marque **Public**
5. **NÃO** marque "Add a README file" (já temos um)
6. Clique em **Create repository**

### 2. Configurar Git Local
```bash
# Execute o script de inicialização
init-github.bat

# Adicionar remote (substitua SEU-USUARIO)
git remote add origin https://github.com/SEU-USUARIO/ftp-server-android.git

# Fazer push
git push -u origin main
```

## 📝 Configurações Recomendadas do Repositório

### 1. Configurações Gerais
- **Description**: `📱 Servidor FTP completo para Android`
- **Website**: Link para releases ou documentação
- **Topics**: `android`, `ftp`, `server`, `java`, `mobile`, `file-transfer`

### 2. Configurar Issues
1. **Settings** → **Features**
2. Ative **Issues**
3. Crie templates de issue (opcional)

### 3. Configurar Releases
1. **Releases** → **Create a new release**
2. **Tag version**: `v1.0.0`
3. **Release title**: `🎉 Primeira versão - FTP Server Android v1.0.0`
4. **Description**: Copie do CHANGELOG.md
5. **Attach binaries**: Adicione o APK compilado

### 4. Configurar Branch Protection (Opcional)
1. **Settings** → **Branches**
2. **Add rule** para `main`
3. Configure proteções desejadas

## 📱 Adicionando o APK às Releases

### 1. Compilar APK de Release
```bash
# Compilar versão de release
./gradlew assembleRelease

# APK estará em:
# app/build/outputs/apk/release/app-release-unsigned.apk
```

### 2. Criar Release no GitHub
1. **Releases** → **Create a new release**
2. **Choose a tag**: `v1.0.0`
3. **Release title**: `📱 FTP Server Android v1.0.0`
4. **Describe this release**:
```markdown
## 🎉 Primeira versão do FTP Server Android!

### ✨ Funcionalidades
- 🚀 Servidor FTP completo
- 🎨 Interface Material Design
- ⚙️ Configuração flexível
- 📁 Compartilhamento seguro
- 🌐 Detecção automática de IP

### 📱 Instalação
1. Baixe o APK abaixo
2. Ative "Fontes desconhecidas" no Android
3. Instale o APK
4. Conceda as permissões solicitadas

### 🔗 Como usar
Veja o [README](README.md) para instruções completas.
```
5. **Attach files**: Arraste o APK compilado
6. **Publish release**

## 🏷️ Configurar Topics e Labels

### Topics Sugeridos:
```
android, ftp, server, java, mobile, file-transfer, 
networking, material-design, open-source
```

### Labels para Issues:
- `bug` - Algo não está funcionando
- `enhancement` - Nova funcionalidade ou solicitação
- `documentation` - Melhorias na documentação
- `good first issue` - Bom para iniciantes
- `help wanted` - Ajuda extra é bem-vinda
- `question` - Mais informações são solicitadas

## 📊 README Badges

Adicione badges ao README para mostrar status:

```markdown
![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)
![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=java&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![GitHub release](https://img.shields.io/github/v/release/SEU-USUARIO/ftp-server-android?style=for-the-badge)
![GitHub downloads](https://img.shields.io/github/downloads/SEU-USUARIO/ftp-server-android/total?style=for-the-badge)
```

## 🔄 Workflow de Desenvolvimento

### Para futuras atualizações:
```bash
# Fazer mudanças no código
git add .
git commit -m "feat: adiciona nova funcionalidade X"
git push origin main

# Para releases:
git tag v1.1.0
git push origin v1.1.0
# Criar release no GitHub com o novo APK
```

## ✅ Checklist Final

- [ ] Repositório criado no GitHub
- [ ] Código enviado (`git push`)
- [ ] README.md atualizado com link correto
- [ ] APK compilado e testado
- [ ] Release v1.0.0 criada com APK
- [ ] Topics e descrição configurados
- [ ] Issues habilitados
- [ ] Licença MIT configurada

## 🎉 Pronto!

Seu projeto agora está no GitHub e pronto para ser compartilhado com o mundo!

**Link do repositório**: `https://github.com/SEU-USUARIO/ftp-server-android`

### Próximos passos:
1. Compartilhe o link com amigos
2. Adicione mais funcionalidades
3. Aceite contribuições da comunidade
4. Mantenha a documentação atualizada

Boa sorte com seu projeto open source! 🚀