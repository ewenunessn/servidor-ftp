# 🤝 Contribuindo para o FTP Server Android

Obrigado por considerar contribuir para este projeto! Sua ajuda é muito bem-vinda.

## 📋 Como Contribuir

### 1. Reportando Bugs
- Use o [template de bug report](../../issues/new?template=bug_report.md)
- Inclua informações detalhadas sobre o problema
- Adicione screenshots se possível
- Mencione a versão do Android e do app

### 2. Sugerindo Features
- Use o [template de feature request](../../issues/new?template=feature_request.md)
- Descreva claramente a funcionalidade desejada
- Explique por que seria útil
- Considere a implementação

### 3. Enviando Pull Requests

#### Preparação
1. **Fork** o repositório
2. **Clone** seu fork localmente
3. **Crie** uma branch para sua feature:
   ```bash
   git checkout -b feature/nome-da-feature
   ```

#### Desenvolvimento
1. **Siga** as convenções de código existentes
2. **Adicione** testes se aplicável
3. **Documente** mudanças significativas
4. **Teste** em diferentes versões do Android

#### Submissão
1. **Commit** suas mudanças:
   ```bash
   git commit -m "feat: adiciona nova funcionalidade X"
   ```
2. **Push** para sua branch:
   ```bash
   git push origin feature/nome-da-feature
   ```
3. **Abra** um Pull Request

## 📝 Convenções de Código

### Java
- Use **camelCase** para variáveis e métodos
- Use **PascalCase** para classes
- Adicione **comentários** para lógica complexa
- Mantenha **métodos pequenos** e focados

### XML
- Use **snake_case** para IDs
- Mantenha **indentação consistente**
- Agrupe **atributos relacionados**

### Commits
Use o padrão [Conventional Commits](https://conventionalcommits.org/):
- `feat:` nova funcionalidade
- `fix:` correção de bug
- `docs:` documentação
- `style:` formatação
- `refactor:` refatoração
- `test:` testes
- `chore:` tarefas de manutenção

## 🧪 Testando

### Testes Locais
1. **Compile** o projeto:
   ```bash
   ./gradlew assembleDebug
   ```
2. **Instale** em dispositivo/emulador
3. **Teste** funcionalidades básicas:
   - Iniciar/parar servidor
   - Conectar via cliente FTP
   - Transferir arquivos
   - Diferentes configurações

### Dispositivos de Teste
Teste em pelo menos:
- **Android 5.0** (API 21) - versão mínima
- **Android 10+** - versões recentes
- **Diferentes fabricantes** (Samsung, Xiaomi, etc.)

## 📚 Recursos Úteis

### Documentação
- [Android Developer Guide](https://developer.android.com/guide)
- [Material Design](https://material.io/design)
- [RFC 959 - FTP Protocol](https://tools.ietf.org/html/rfc959)

### Ferramentas
- **Android Studio** - IDE recomendada
- **ADB** - Debug e instalação
- **FileZilla** - Cliente FTP para testes

## 🎯 Áreas que Precisam de Ajuda

### Funcionalidades
- [ ] Suporte a SSL/TLS
- [ ] Interface para múltiplos usuários
- [ ] Logs de acesso detalhados
- [ ] Configuração de diretórios personalizados
- [ ] Modo passivo FTP

### Melhorias
- [ ] Otimização de performance
- [ ] Suporte a IPv6
- [ ] Temas escuro/claro
- [ ] Tradução para outros idiomas
- [ ] Testes automatizados

### Documentação
- [ ] Tutoriais em vídeo
- [ ] Guias de troubleshooting
- [ ] Documentação da API
- [ ] Exemplos de uso

## 🚀 Configuração do Ambiente

### Requisitos
- **Java 11+**
- **Android Studio Arctic Fox+**
- **Android SDK 21+**
- **Git**

### Setup
1. **Clone** o repositório:
   ```bash
   git clone https://github.com/seu-usuario/ftp-server-android.git
   ```
2. **Abra** no Android Studio
3. **Sincronize** o Gradle
4. **Configure** um dispositivo/emulador
5. **Execute** o projeto

## ❓ Dúvidas?

- **Issues**: Para bugs e features
- **Discussions**: Para perguntas gerais
- **Email**: Para questões privadas

## 🏆 Reconhecimento

Todos os contribuidores serão listados no README e releases notes.

Obrigado por ajudar a tornar este projeto melhor! 🙏