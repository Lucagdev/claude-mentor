# Lição 09 — Construa e Publique: do Zero à Internet

## Objetivos
- Criar um projeto real do zero com o Claude Code
- Aprender o básico de Git e GitHub na prática
- Publicar o projeto na internet usando GitHub Pages
- Ter um link pra mostrar pra amigos e família

## Pré-requisito
- Ter completado pelo menos as lições 1 e 2

---

## Parte 1: Git — Salvando seu trabalho

### O que é o Git?

O Git é como um "histórico de versões" do seu projeto. Sabe quando você salva um documento como "trabalho_final_v2_corrigido_ESSE_SIM.docx"? O Git resolve isso — ele guarda cada versão automaticamente, e você pode voltar a qualquer uma delas.

### Conceitos essenciais (só 3)

- **Repositório (repo)** — é a pasta do seu projeto, mas com superpoderes. O Git guarda o histórico dentro dela
- **Commit** — é como tirar uma "foto" do projeto naquele momento. Cada foto tem uma descrição do que mudou
- **Push** — é enviar essas "fotos" pro GitHub (a nuvem), pra ficar salvo online

### Exercício: Primeiros comandos Git

Ensine o usuário a:
1. `git init` — "Isso transforma sua pasta num repositório Git. É como ativar o modo 'histórico' na pasta"
2. `git add .` — "Isso seleciona todos os arquivos pra próxima foto. É como escolher quais documentos guardar"
3. `git commit -m "primeiro commit"` — "Isso tira a foto e coloca uma legenda. Agora seu trabalho está salvo"

**Importante:** antes de rodar cada comando, explique o que ele faz e peça permissão. Mostre o resultado e explique o que aconteceu.

---

## Parte 2: GitHub — Sua vitrine na internet

### O que é o GitHub?

O GitHub é como um Google Drive pra código. Você guarda seus projetos lá, e outras pessoas podem ver. Muitos programadores usam o GitHub como portfólio — é o "LinkedIn dos desenvolvedores".

### Criar conta no GitHub

Guie o usuário passo a passo:
1. Acesse https://github.com
2. Clique em "Sign up"
3. Crie com e-mail e senha
4. Escolha um username (esse vai aparecer no link do site!)
5. Confirme o e-mail

**Dica pro usuário:** "Escolha um username profissional — ele vai aparecer no endereço do seu site: seunome.github.io"

### Configurar Git no computador

Ensine a configurar nome e e-mail:
```
git config --global user.name "Seu Nome"
git config --global user.email "seu@email.com"
```

**Explique:** "Isso diz pro Git quem você é. Toda vez que você salvar uma versão (commit), ele marca com seu nome — como uma assinatura."

### Autenticar com GitHub

Guie a autenticação via `gh auth login`:
1. Explique que o `gh` é o GitHub CLI — "é como conversar com o GitHub pelo terminal"
2. Se não tiver instalado, instale com o gerenciador de pacotes (explique o que está instalando e por quê)
3. Rode `gh auth login` e guie cada passo do fluxo interativo
4. **Explique cada pergunta** que o gh faz (protocolo, autenticação web, etc.)

---

## Parte 3: Criar o projeto

### Opções de projeto (pergunte ao usuário)

Sugira ideias simples e impactantes:
- **Portfólio pessoal** — página com nome, sobre, projetos, contato
- **Link na bio** — tipo Linktree, com seus links organizados
- **Página de um produto** — landing page pra algo que você vende ou promove
- **Currículo online** — versão web do seu CV

### Construir junto

1. Crie a estrutura de arquivos (HTML + CSS simples, ou com framework se o usuário preferir)
2. **A cada arquivo criado**, explique o que ele faz: "O index.html é a página principal — é o que as pessoas veem quando acessam seu site"
3. Faça commits incrementais, explicando: "Vou salvar essa versão — assim se algo der errado, podemos voltar"
4. Personalize com as informações do usuário (nome, bio, links)

**Transparência total:** se precisar instalar Node.js, npm, ou qualquer ferramenta:
- Explique o que é
- Diga por que precisa
- Informe o impacto no computador
- Peça permissão

---

## Parte 4: Publicar na internet (Deploy)

### O que é GitHub Pages?

"O GitHub Pages é um serviço gratuito que transforma seu repositório num site de verdade. Você sobe o código, e o GitHub cria um endereço pra qualquer pessoa acessar. Seu site fica em: seunome.github.io/nome-do-projeto."

### Passo a passo

1. Criar repositório no GitHub:
   ```
   gh repo create nome-do-projeto --public --source . --push
   ```
   **Explique cada parte:** `--public` = qualquer pessoa pode ver, `--source .` = usa a pasta atual, `--push` = envia os arquivos

2. Ativar GitHub Pages:
   ```
   gh api repos/USUARIO/REPO/pages -X POST -f source.branch=main -f source.path=/
   ```
   Ou guie pelo navegador: Settings → Pages → Source → main → Save

3. Aguardar 1-2 minutos e acessar o link

### O momento mágico

Quando o site estiver no ar, diga algo como:
"Pronto! Seu site está ao vivo em https://seunome.github.io/nome-do-projeto. Qualquer pessoa no mundo pode acessar esse link agora — manda pra um amigo e vê a reação!"

---

## Parte 5: Próximos passos

Depois do deploy, sugira:
- "Quer personalizar mais? Podemos mudar cores, adicionar fotos, melhorar o layout"
- "Quer um domínio próprio? (seunome.com) — posso te explicar como configurar"
- "Quer adicionar mais páginas ou funcionalidades?"

---

## Critérios de Validação

Você concluiu esta lição quando:
- [ ] Entendeu o que é Git, commit e push
- [ ] Tem uma conta no GitHub
- [ ] Criou um projeto e fez pelo menos 1 commit
- [ ] O projeto está publicado e acessível por um link
- [ ] Mandou o link pra alguém e a pessoa conseguiu abrir
