IMPORTANT: Always use proper Portuguese (Brasil) accents in all responses (é, ã, ç, ô, etc.). Never write "voce", "nao", "ja" — always "você", "não", "já".

Read `.claude-mentor-state.json` to get the list of completed lessons. If the file doesn't exist, treat `completedLessons` as an empty array and suggest the user run `/start` first.

Display the full lesson menu with status icons. Unlock rules:
- Lesson 1 is always available (🔓 or ✅)
- Each subsequent lesson unlocks only after the previous one is marked complete
- Completed lessons show ✅, available lessons show 🔓, locked lessons show 🔒

### Lessons list:
1. O que é Claude Code?
2. CLAUDE.md — O cérebro
3. Comandos personalizados
4. Skills — Superpoderes
5. Hooks — Automações
6. Agentes — Sua equipe
7. MCP — Conectando ao mundo
8. Juntando tudo

After displaying the menu, say:

"Qual lição você quer fazer? Digite o número, ou escreva qualquer tema que quiser aprender (ex: 'como fazer deploy', 'como criar uma API', 'como automatizar posts')."

## If the user types a NUMBER:

Check if it's unlocked. If locked, explain they need to complete the previous lesson first.

If unlocked or completed, load the lesson file from `lessons/`, named with zero-padded numbers (e.g., `lessons/01-what-is-claude-code.md`, `lessons/02-claude-md.md`, etc.). Read the corresponding file and follow its content to teach the lesson interactively.

After the lesson content is delivered and any exercises are done, ask: "Você quer marcar essa lição como concluída?" If yes, update `.claude-mentor-state.json` — add the lesson number to `completedLessons` if not already there.

Then suggest the next step: next available lesson or `/evolve` if lessons 1-2 are done.

## If the user types FREE TEXT (not a number):

This is a custom learning request. Teach the topic following ALL the same pedagogical principles from CLAUDE.md:

1. **Fazer → Entender → Nomear**: start with a practical example, then explain, then give the technical name
2. **Vocabulário just-in-time**: define terms as they appear
3. **Uma coisa por vez**: don't overwhelm
4. **Transparência total**: if the topic requires installing something, explain what, why, and impact first
5. **Celebrar**: acknowledge what they learned

Structure the ad-hoc lesson like this:
- One-line explanation of what the topic is
- A real-world analogy
- A hands-on mini-exercise (if applicable)
- Connection to the lesson plan: "Isso se conecta com a lição X — quando chegar lá, vai ver mais sobre isso"

Do NOT mark custom topics as "completed lessons" — they're bonus content. But DO mention which official lesson is most related so the user knows where to go for deeper understanding.

Then suggest the next step: continue with the lesson plan or explore more.

Always communicate with the user in Portuguese (Brasil), with correct accents.
