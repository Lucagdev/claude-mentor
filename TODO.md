# Claude Code para Iniciantes — Melhorias Mapeadas

## Bugs / Ajustes Urgentes

- [x] **JSON sendo lido toda vez**: instruído no CLAUDE.md pra ler só no início da sessão
- [x] **Explicar permissões do Claude Code**: adicionado no fluxo do /start (apertar 1, 2, 3)
- [x] **Exercício da lição 1 precisa de "UAU"**: implementado com xdg-open/open
- [x] **Acentos na landing page**: corrigidos todos os acentos em docs/index.html

## Melhorias de UX

- [x] **Lição 0 implícita**: coberta pelo fluxo do /start (permissões + interação)
- [ ] **Progresso visual mais rico**: mostrar barra de progresso, não só "1/8"
- [ ] **Dicas contextuais**: quando o Claude faz uma ação (Write, Read), explicar o que aquele "badge" significa na primeira vez que aparece
- [ ] **Rate limit**: adicionar detecção/explicação quando o usuário bater no limite

## Conteúdo

- [ ] **Lições em outros idiomas**: inglês como prioridade
- [ ] **Templates de /evolve**: pré-configurações pra nichos (blog, API, automação, marketing)
- [ ] **Lição bônus**: como economizar tokens (usar /compact, escolher modelo certo, etc.)

## Infraestrutura

- [x] **CONTRIBUTING.md**: guia pra contribuidores
- [ ] **GitHub Issues como backlog**: migrar esses TODOs pra issues
- [ ] **CI**: validar que os .md files têm acentuação correta
- [ ] **Screenshots no README**: removidas img tags quebradas, adicionar quando tiver screenshots reais
