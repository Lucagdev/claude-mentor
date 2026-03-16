# Lição 01 — O que é o Claude Code?

## Objetivos
- Entender o que é o Claude Code e como ele difere de outras IAs de chat
- Saber navegar pelos comandos básicos
- Completar sua primeira interação real no terminal

## Conceito Principal

Claude Code é um assistente de IA que roda **dentro do seu terminal**. Diferente do ChatGPT ou do Claude.ai (que vivem no navegador), o Claude Code tem acesso direto ao seu sistema de arquivos, pode rodar comandos, ler código, criar arquivos e executar tarefas sem que você precise copiar e colar nada.

**Analogia:** É como ter um programador sênior sentado do seu lado no terminal — você pede algo em linguagem natural e ele executa, lê o resultado, corrige o erro, e te avisa quando terminou.

### Claude.ai vs Claude Code

| Claude.ai | Claude Code |
|-----------|-------------|
| Navegador | Terminal |
| Você copia o código | Ele edita o arquivo diretamente |
| Sem acesso ao seu sistema | Lê, cria e executa arquivos |
| Ótimo para conversas | Ótimo para trabalho real |

## Comandos Básicos

Você não precisa aprender sintaxe especial — só digitar naturalmente já funciona. Mas existem alguns comandos úteis:

- `/help` — lista todos os comandos disponíveis
- `/compact` — comprime o histórico da conversa (economiza tokens)
- `/clear` — limpa o contexto e começa uma conversa nova
- `/exit` ou `Ctrl+C` — sai do Claude Code

## Permissões

Porque o Claude Code tem acesso real ao seu computador, ele **pede permissão antes de agir**. Isso é uma proteção — ele não faz nada às escondidas.

Quando você vê uma mensagem assim no terminal:

```
Do you want to proceed?
1. Yes, for this session
2. Yes, always
3. No
```

Isso é o Claude pedindo sua autorização. Veja o que cada opção faz:

- **1 — Aceitar uma vez**: ele faz aquela ação agora, mas vai perguntar de novo na próxima
- **2 — Aceitar sempre**: ele nunca mais pergunta para esse tipo de ação na sessão atual
- **3 — Rejeitar**: ele não faz nada e aguarda outra instrução

**Dica prática:** Para ações comuns como ler e criar arquivos, pode apertar **2** sem medo. É seguro e evita interrupções a cada passo.

## Exercício

Agora vem a parte mais legal — você vai ver o Claude Code agir no mundo real. Peça para ele criar um arquivo com uma mensagem criativa e depois **abrir esse arquivo no seu computador**.

Não é só texto no terminal: o arquivo vai aparecer na sua tela, aberto pelo sistema, como se você tivesse clicado duas vezes nele.

**Sugestão de prompt:**
> "Cria um arquivo chamado ola.txt com uma mensagem de boas-vindas criativa, e depois abre ele no meu computador pra eu ver"

O Claude vai criar o arquivo e usar o comando certo para o seu sistema operacional:
- No **Linux ou WSL**: `xdg-open ola.txt`
- No **macOS**: `open ola.txt`

Quando o arquivo aparecer aberto na sua tela, esse é o momento "uau" — a IA criou algo no seu computador e abriu pra você ver, tudo a partir de uma frase em português.

## Critérios de Validação

Você concluiu esta lição quando:
- [ ] O arquivo `ola.txt` foi criado com sucesso
- [ ] O arquivo abriu automaticamente no seu computador
- [ ] Você entendeu a diferença entre Claude Code e Claude.ai
- [ ] Você sabe o que fazer quando o Claude pede permissão
