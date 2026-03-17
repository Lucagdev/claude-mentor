IMPORTANT: Always use proper Portuguese (Brasil) accents in all responses (é, ã, ç, ô, etc.). Never write "voce", "nao", "ja" — always "você", "não", "já".

Read `.claude-code-iniciantes-state.json`. Check the `completedLessons` array.

## If lessons 1 and 2 are NOT both completed:

Tell the user (in Portuguese, with correct accents) that to evolve the workspace they should first complete at least lessons 1 and 2, since those cover the foundational concepts (what Claude Code is and how CLAUDE.md works). Suggest running `/learn` to continue.

## If lessons 1 and 2 are completed:

Ask the user: "O que você quer construir?" and offer examples to spark ideas:
- Um site ou landing page
- Uma API ou backend
- Automações e scripts
- Geração de conteúdo (posts, vídeos, etc.)
- Estudos e aprendizado
- Um projeto pessoal específico

Wait for their answer. Based on what they describe, propose a personalized transformation plan.

---

## CRITICAL RULE: Transparência total antes de instalar qualquer coisa

Before installing ANY tool, package, dependency, or program on the user's computer, you MUST:

1. Explain what it is in simple terms (name + one-line definition + analogy)
2. Explain WHY it's needed (what problem it solves for their specific project)
3. Explain the IMPACT on their computer (where it installs, approximate size, any system changes)
4. Ask for explicit permission before proceeding

This applies to EVERYTHING: Node.js, Python, pnpm, npm, pip, uv, MCP servers, VS Code extensions, databases, Docker, etc.

Example of good transparency:
"Pra criar seu blog, vou precisar instalar o **Node.js**. É um programa que permite rodar JavaScript (a linguagem mais usada pra sites) no seu computador. Ele vai ocupar uns 100MB e fica na pasta do sistema. Sem ele, não tem como rodar o framework do blog. Posso instalar?"

Example of BAD behavior (NEVER do this):
"Vou rodar npm install..." (user has no idea what npm is or what it's installing)

Never assume the user knows what any package manager, framework, or tool is. Explain EVERYTHING.

---

## Plan presentation

The plan should cover exactly what changes to make to turn this learning environment into their workspace. Present it with two clear sections:

### O que vai ser INSTALADO no seu computador:
List every tool, package manager, framework, database, or program that will be installed. For each one, include: name, one-line description, approximate size/impact. If nothing needs to be installed, say so explicitly.

### O que vai ser CONFIGURADO (sem instalação):
1. **CLAUDE.md** — What context to add: their stack, goals, workflow preferences, tools they use
2. **Commands** — Which slash commands would help them (e.g., `/new-post`, `/deploy`, `/test`, `/research`)
3. **Skills** — Any reusable prompt files that would save them time
4. **Agents** — Whether any tasks benefit from isolated agent calls
5. **MCP servers** — Which integrations make sense (e.g., filesystem, browser, GitHub, databases)

Present the full plan clearly. Ask: "Posso executar esse plano?" and wait for confirmation.

## If confirmed:

Execute step by step. For each change:
- Say what you're about to do (one sentence)
- If it involves installing something: explain what it is, why it's needed, the impact, and ask permission before proceeding
- Do it
- Confirm it's done

At the end, tell the user their workspace is ready and briefly explain how to use what was set up.

Always communicate with the user in Portuguese (Brasil), with correct accents.
