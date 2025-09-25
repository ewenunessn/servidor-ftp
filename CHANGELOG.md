# 📝 Changelog

Todas as mudanças notáveis neste projeto serão documentadas neste arquivo.

O formato é baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/),
e este projeto adere ao [Semantic Versioning](https://semver.org/lang/pt-BR/).

## [Não Lançado]

### Planejado
- Suporte a SSL/TLS
- Interface para múltiplos usuários
- Logs de acesso detalhados
- Tema escuro
- Tradução para outros idiomas

## [1.0.0] - 2025-09-25

### Adicionado
- 🎉 **Primeira versão** do FTP Server Android
- 🚀 **Servidor FTP completo** com implementação nativa
- 🎨 **Interface Material Design** moderna e intuitiva
- ⚙️ **Configuração flexível** de porta, usuário e senha
- 📁 **Compartilhamento** da pasta Downloads do dispositivo
- 🌐 **Detecção automática** do IP do dispositivo
- 📊 **Indicador visual** do status do servidor
- 🔒 **Sistema de autenticação** com usuário e senha
- 📱 **Suporte** para Android 5.0+ (API 21)
- 🛡️ **Tratamento de permissões** robusto
- 📋 **Comandos FTP básicos**: USER, PASS, LIST, PWD, QUIT, TYPE
- 🔧 **Scripts de configuração** para Windows
- 📚 **Documentação completa** do projeto

### Técnico
- Implementação FTP usando Java Socket Programming
- Service em background para o servidor
- Material Design Components
- Gradle 8.4 com Android Gradle Plugin 8.1.2
- Suporte a Java 11+ para compilação
- Ícones vetoriais adaptativos
- Tratamento de exceções robusto

### Arquivos Incluídos
- `MainActivity.java` - Interface principal
- `FtpServerService.java` - Serviço do servidor FTP
- `activity_main.xml` - Layout da interface
- `AndroidManifest.xml` - Configurações e permissões
- Scripts de configuração (`.bat` files)
- Documentação completa (README, SETUP, CONTRIBUTING)

---

## 📋 Tipos de Mudanças

- `Added` - para novas funcionalidades
- `Changed` - para mudanças em funcionalidades existentes
- `Deprecated` - para funcionalidades que serão removidas
- `Removed` - para funcionalidades removidas
- `Fixed` - para correções de bugs
- `Security` - para correções de vulnerabilidades

## 🔗 Links

- [Repositório](https://github.com/seu-usuario/ftp-server-android)
- [Issues](https://github.com/seu-usuario/ftp-server-android/issues)
- [Releases](https://github.com/seu-usuario/ftp-server-android/releases)