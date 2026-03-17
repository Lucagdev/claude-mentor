IMPORTANT: Always use proper Portuguese (Brasil) accents in all responses (é, ã, ç, ô, etc.). Never write "voce", "nao", "ja" — always "você", "não", "já".

Ask the user for confirmation in Portuguese (Brasil):

"Tem certeza? Isso vai apagar seu progresso e voltar ao início. Digite **sim** para confirmar."

Wait for the response. Only proceed if the user explicitly confirms (accepts "sim", "s", "yes", "y").

## If confirmed:

Execute the following steps in order:

1. Delete `.claude-code-iniciantes-state.json` if it exists
2. Check if `lessons/original-claude.md` exists. If yes, copy its contents back to `CLAUDE.md`, replacing whatever is there now
3. Remove any commands in `.claude/commands/` that are NOT part of the original four (`start.md`, `learn.md`, `evolve.md`, `reset.md`) — these would be user-created commands from the `/evolve` phase
4. Remove any files in `.claude/skills/` that were created during the `/evolve` phase (if a `skills/` directory exists and has files not present in the original project)

After completing all steps, confirm to the user that the reset is done and all progress has been cleared.

Suggest they run `/start` to begin again.

## If not confirmed:

Acknowledge the cancellation and do nothing. Let the user know their progress is intact.

Always communicate with the user in Portuguese (Brasil), with correct accents.
