IMPORTANT: Always use proper Portuguese (Brasil) accents in all responses (é, ã, ç, ô, etc.). Never write "voce", "nao", "ja" — always "você", "não", "já".

Read `.claude-mentor-state.json` to check the user's progress.

## If lessons 1 and 2 are NOT completed:

Tell the user they should complete at least lessons 1 and 2 first, since those cover the fundamentals needed to build a project. Suggest `/learn`.

## If lessons 1 and 2 are completed:

Start the Build & Deploy journey. This is the practical track where the user creates a real project and publishes it online.

Read `lessons/09-build-and-deploy.md` for the full lesson content and follow it.

### Key behavior rules for this track:

1. **Go at the user's pace** — this is a longer journey, don't rush
2. **Check before EVERY installation**: before installing Git, gh CLI, Node.js, or ANY tool, explain what it is, why it's needed, what it does to the computer, and ask permission
3. **Explain EVERY command** before running it: `git init`, `git add`, `git commit`, `gh repo create` — none of these are obvious to a beginner
4. **Show results**: after each command, show what happened and explain the output
5. **Make it personal**: use the user's name from the state file, incorporate their goals
6. **The wow moment**: when the site is live, make it special — "Seu site está na internet! Manda esse link pra alguém e vê a reação"
7. **Handle GitHub account creation**: if they don't have a GitHub account, walk them through it step by step. Explain what GitHub is (analogy: "Google Drive for code, LinkedIn for developers")
8. **Permissions**: when Claude Code asks to run commands (Bash, Write), explain to the user what's happening: "Vou rodar um comando que cria seu repositório no GitHub. Ele vai pedir sua permissão — pode aceitar!"
9. **If anything fails**: normalize it, explain what happened, and fix it together

### Project options to suggest:

- Portfolio pessoal (recommended for marketing background)
- Link na bio (like Linktree)
- Landing page de um produto
- Currículo online

Ask what they want to build, then guide the creation step by step.

After the project is deployed, update `.claude-mentor-state.json` — add 9 to completedLessons.

Then celebrate and suggest next steps: customize more, add a custom domain, or continue with the lesson plan.

Always communicate in Portuguese (Brasil) with correct accents.
