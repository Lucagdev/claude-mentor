# Contribuindo com o Claude Code para Iniciantes

Obrigado por querer contribuir! Este projeto é feito pra ensinar iniciantes, então qualquer melhoria no conteúdo pedagógico é muito bem-vinda.

## Como contribuir

### 1. Reportar problemas

Achou algo confuso? O Claude respondeu de um jeito estranho? Abra uma [issue](https://github.com/Lucagdev/claude-code-iniciantes/issues) descrevendo:
- O que você fez (qual comando/lição)
- O que esperava acontecer
- O que aconteceu de verdade
- Print da tela (se possível)

### 2. Melhorar lições existentes

As lições ficam em `lessons/`. Cada uma segue este formato:
- **Objetivos** — 2-3 bullet points
- **Conceito** — explicação curta com analogia
- **Exercício** — prática hands-on
- **Critérios de Validação** — como saber se concluiu

**Regras de escrita:**
- Português do Brasil com acentuação correta
- Tom acolhedor, nunca dizer "é fácil" ou "é simples"
- Uma coisa por vez — nunca dois conceitos juntos
- Termos técnicos: **negrito** + definição + analogia na primeira vez

### 3. Criar novas lições

Quer adicionar uma lição? Crie um arquivo em `lessons/` seguindo o padrão numérico (ex: `09-testing.md`). Siga o formato das lições existentes.

### 4. Melhorar o instalador

O `install.sh` precisa funcionar em:
- Linux (Ubuntu, Mint, Fedora, Arch)
- macOS
- Windows WSL

Teste em pelo menos um desses antes de abrir PR.

### 5. Criar templates de /evolve

Tem uma ideia de workspace pré-configurado? (ex: blog, API, automação, marketing) Abra uma issue descrevendo o que o template incluiria.

## Fluxo de trabalho

```bash
# 1. Fork o repositório no GitHub

# 2. Clone seu fork
git clone https://github.com/SEU_USUARIO/claude-code-iniciantes.git
cd claude-code-iniciantes

# 3. Crie uma branch
git checkout -b minha-melhoria

# 4. Faça suas alterações

# 5. Commit
git add .
git commit -m "feat: descrição da melhoria"

# 6. Push e abra um PR
git push origin minha-melhoria
```

## Princípios pedagógicos

Se você vai mexer no conteúdo, leia esses princípios (estão detalhados no `CLAUDE.md`):

- **Fazer → Entender → Nomear**: primeiro o aluno faz, depois entende, depois aprende o nome técnico
- **Vocabulário just-in-time**: termos técnicos só quando necessários
- **Uma coisa por vez**: nunca sobrecarregar
- **Scaffolding**: começar guiando, depois ir soltando
- **Erro é normal**: nunca fazer o aluno se sentir burro

## Dúvidas?

Abre uma issue ou me chama no [Threads](https://www.threads.com/@lucasgduartee).
