#!/usr/bin/env bash
set -euo pipefail

# ─── Colors & helpers ─────────────────────────────────────────────────────────
# Palette: amber/gold accent (consistent with landing page)
GREEN='\033[0;32m'
AMBER='\033[1;33m'
RED='\033[0;31m'
GOLD='\033[0;33m'
BOLD='\033[1m'
DIM='\033[2m'
RESET='\033[0m'

info()    { echo -e "  ${AMBER}ℹ${RESET}  $*"; }
ok()      { echo -e "  ${GREEN}✔${RESET}  $*"; }
warn()    { echo -e "  ${GOLD}⚠${RESET}  $*"; }
fail()    { echo -e "  ${RED}✖${RESET}  $*" >&2; }
tip()     { echo -e "     ${DIM}$*${RESET}"; }
vocab()   { echo -e "     ${AMBER}${BOLD}Vocabulário:${RESET} ${DIM}$*${RESET}"; }
br()      { echo; }

pause() {
  br
  read -rp "$(echo -e "     ${DIM}Aperte ENTER quando estiver pronto...${RESET} ")" _
  br
}

# ─── Banner ───────────────────────────────────────────────────────────────────
clear 2>/dev/null || true
echo -e "${AMBER}"
cat << 'BANNER'
   _____ _                 _        __  __            _
  / ____| |               | |      |  \/  |          | |
 | |    | | __ _ _   _  __| | ___  | \  / | ___ _ __ | |_ ___  _ __
 | |    | |/ _` | | | |/ _` |/ _ \ | |\/| |/ _ \ '_ \| __/ _ \| '__|
 | |____| | (_| | |_| | (_| |  __/ | |  | |  __/ | | | || (_) | |
  \_____|_|\__,_|\__,_|\__,_|\___| |_|  |_|\___|_| |_|\__\___/|_|

BANNER
echo -e "${RESET}"
echo -e "  ${DIM}────────────────────────────────────────────────────${RESET}"
echo -e "  ${BOLD}por Lucas Duarte${RESET}"
echo -e "  ${DIM}Threads: ${AMBER}threads.com/@lucasgduartee${RESET}"
echo -e "  ${DIM}GitHub:  ${AMBER}github.com/Lucagdev${RESET}"
echo -e "  ${DIM}YouTube: ${AMBER}youtube.com/@lucasgdev${RESET}"
echo -e "  ${DIM}────────────────────────────────────────────────────${RESET}"
br
echo -e "  ${BOLD}Olá! Bem-vindo ao instalador do Claude Code para Iniciantes.${RESET}"
br
echo -e "  Eu sou um script que vai preparar tudo no seu computador"
echo -e "  pra você começar a aprender programação com inteligência artificial."
br
echo -e "  ${BOLD}O que vai acontecer aqui:${RESET}"
echo -e "    1. Vou verificar o que já tem instalado no seu PC"
echo -e "    2. Se faltar algo, instalo pra você (com sua permissão)"
echo -e "    3. Baixo os arquivos do projeto"
echo -e "    4. Abro a IA pra você começar a conversar com ela"
br
echo -e "  ${DIM}Não se preocupe — vou explicar tudo que estiver acontecendo.${RESET}"
echo -e "  ${DIM}Se algo der errado, vou te dizer exatamente o que fazer.${RESET}"

pause

# ─── Detect OS ────────────────────────────────────────────────────────────────
echo -e "  ${AMBER}${BOLD}── Passo 1 de 4: Conhecendo seu computador ──${RESET}"
br
echo -e "  Primeiro, preciso saber qual sistema você usa."
echo -e "  Isso é importante porque cada sistema instala programas de um jeito."
br

OS="unknown"
case "${OSTYPE:-}" in
  linux*)
    if grep -qi microsoft /proc/version 2>/dev/null; then
      OS="wsl"
    else
      OS="linux"
    fi
    ;;
  darwin*)
    OS="macos"
    ;;
  *)
    if [[ -f /proc/version ]]; then
      if grep -qi microsoft /proc/version 2>/dev/null; then OS="wsl"; else OS="linux"; fi
    elif [[ "$(uname -s 2>/dev/null)" == "Darwin" ]]; then
      OS="macos"
    fi
    ;;
esac

case "$OS" in
  linux)
    ok "Você está usando ${BOLD}Linux${RESET}."
    tip "Linux é um sistema operacional gratuito, muito usado por programadores."
    ;;
  wsl)
    ok "Você está usando ${BOLD}Windows com WSL${RESET}."
    tip "WSL é uma forma de rodar Linux dentro do Windows."
    tip "É exatamente o que precisamos — ótimo!"
    ;;
  macos)
    ok "Você está usando ${BOLD}macOS${RESET} (Apple)."
    ;;
  *)
    fail "Não consegui identificar seu sistema."
    br
    echo -e "  O Claude Code para Iniciantes funciona em Linux, macOS e Windows (com WSL)."
    br
    echo -e "  ${BOLD}Se você usa Windows sem WSL:${RESET}"
    echo -e "  Abra o PowerShell como Administrador e digite:"
    echo -e "    ${AMBER}wsl --install${RESET}"
    echo -e "  Depois reinicie o PC e rode este instalador de novo."
    br
    vocab "WSL = Windows Subsystem for Linux. Um jeito de rodar"
    tip "programas Linux dentro do Windows, sem precisar trocar de sistema."
    exit 1
    ;;
esac

vocab "Sistema operacional = o programa principal do seu computador"
tip "(Windows, Linux, macOS). Tudo que você faz roda em cima dele."

# ─── Helper: install a package ────────────────────────────────────────────────
install_pkg() {
  local pkg="$1"
  case "$OS" in
    linux|wsl)
      if command -v apt-get &>/dev/null; then
        sudo apt-get update -qq && sudo apt-get install -y -qq "$pkg"
      elif command -v dnf &>/dev/null; then
        sudo dnf install -y -q "$pkg"
      elif command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm "$pkg"
      elif command -v zypper &>/dev/null; then
        sudo zypper install -y "$pkg"
      else
        return 1
      fi
      ;;
    macos)
      if [[ "$pkg" == "git" ]]; then
        xcode-select --install 2>/dev/null || true
        tip "Se aparecer um popup, clique em 'Instalar' e aguarde."
        until command -v git &>/dev/null; do sleep 3; done
      elif command -v brew &>/dev/null; then
        brew install "$pkg"
      fi
      ;;
  esac
}

# ─── Check tools ──────────────────────────────────────────────────────────────
br
echo -e "  ${AMBER}${BOLD}── Passo 2 de 4: Verificando ferramentas ──${RESET}"
br
echo -e "  Agora vou verificar se você tem 3 programas essenciais."
echo -e "  Se algum estiver faltando, instalo pra você."
br

# --- curl ---
echo -e "  ${BOLD}Ferramenta 1/3: curl${RESET}"
if command -v curl &>/dev/null; then
  ok "curl já está instalado."
else
  info "curl não encontrado. Vou instalar."
  br
  echo -e "  ${BOLD}O que é o curl?${RESET}"
  tip "O curl é um programa que baixa coisas da internet pelo terminal."
  tip "Quando você clica num link no navegador, o navegador faz o download."
  tip "O curl faz a mesma coisa, só que por linha de comando."
  tip "Precisamos dele pra baixar o Claude Code no próximo passo."
  br
  vocab "curl = Client URL. Programa pra transferir dados pela internet."
  br
  info "Instalando curl..."

  if install_pkg curl && command -v curl &>/dev/null; then
    ok "curl instalado com sucesso!"
  else
    fail "Não consegui instalar o curl automaticamente."
    br
    echo -e "  Tente você mesmo com um desses comandos:"
    echo -e "    ${AMBER}sudo apt install curl${RESET}   (Ubuntu, Debian, Mint)"
    echo -e "    ${AMBER}sudo dnf install curl${RESET}   (Fedora)"
    br
    tip "Copie o comando, cole aqui no terminal e aperte ENTER."
    tip "Ele vai pedir sua senha — é a senha do seu usuário no computador."
    tip "Quando terminar, rode este instalador de novo."
    exit 1
  fi
fi

br

# --- git ---
echo -e "  ${BOLD}Ferramenta 2/3: git${RESET}"
if command -v git &>/dev/null; then
  ok "git já está instalado."
else
  info "git não encontrado. Vou instalar."
  br
  echo -e "  ${BOLD}O que é o git?${RESET}"
  tip "O git é o programa mais importante do mundo da programação."
  tip "Ele guarda o histórico de tudo que você faz num projeto —"
  tip "como um 'ctrl+z' infinito que nunca esquece nada."
  br
  tip "Quase todo código do mundo é guardado com git."
  tip "Precisamos dele pra baixar os arquivos do Claude Code para Iniciantes."
  br
  vocab "git = sistema de controle de versão."
  tip "Versionar = salvar cada alteração, podendo voltar atrás a qualquer momento."
  br
  info "Instalando git..."

  if install_pkg git && command -v git &>/dev/null; then
    ok "git instalado com sucesso!"
  else
    fail "Não consegui instalar o git automaticamente."
    br
    echo -e "  Tente você mesmo:"
    echo -e "    ${AMBER}sudo apt install git${RESET}   (Ubuntu, Debian, Mint)"
    echo -e "    ${AMBER}sudo dnf install git${RESET}   (Fedora)"
    echo -e "  No macOS: ${AMBER}xcode-select --install${RESET}"
    br
    tip "Depois rode este instalador de novo."
    exit 1
  fi
fi

br

# --- Claude Code ---
echo -e "  ${BOLD}Ferramenta 3/3: Claude Code${RESET}"
if command -v claude &>/dev/null; then
  ok "Claude Code já está instalado!"
else
  info "Claude Code não encontrado. Vou instalar."
  br
  echo -e "  ${BOLD}O que é o Claude Code?${RESET}"
  tip "O Claude Code é uma inteligência artificial criada pela empresa Anthropic."
  tip "Diferente do ChatGPT ou do Claude no navegador, ele roda aqui — no terminal."
  tip "Isso significa que ele pode ler seus arquivos, escrever código,"
  tip "executar programas e te ajudar a construir coisas de verdade."
  br
  tip "Pense nele como um programador muito experiente"
  tip "sentado do seu lado, pronto pra te ajudar."
  br
  vocab "Terminal = essa tela preta onde você está agora."
  tip "Também chamado de 'prompt', 'console' ou 'linha de comando'."
  tip "É onde programadores digitam comandos em vez de clicar em botões."
  br
  info "Baixando e instalando... (pode levar alguns segundos)"
  br

  if curl -fsSL https://claude.ai/install.sh | bash; then
    export PATH="$HOME/.local/bin:$HOME/.npm-global/bin:$PATH"

    if command -v claude &>/dev/null; then
      ok "Claude Code instalado com sucesso!"
    else
      br
      warn "A instalação terminou, mas o terminal precisa ser reiniciado."
      br
      echo -e "  ${BOLD}O que fazer agora:${RESET}"
      echo -e "    1. Feche esta janela do terminal"
      echo -e "    2. Abra um terminal novo"
      echo -e "    3. Rode este mesmo comando de instalação de novo"
      br
      tip "Não se preocupe — na próxima vez, ele vai pular o que já instalou."
      tip "Isso acontece porque o terminal precisa 'recarregar' pra encontrar"
      tip "o programa novo. É normal!"
      exit 0
    fi
  else
    fail "Falha ao instalar o Claude Code."
    br
    echo -e "  Isso geralmente acontece por problema de conexão com a internet."
    echo -e "  Espere alguns minutos e tente de novo."
    br
    echo -e "  Se continuar falhando, tente manualmente:"
    echo -e "    ${AMBER}curl -fsSL https://claude.ai/install.sh | bash${RESET}"
    exit 1
  fi
fi

br
echo -e "  ${AMBER}${BOLD}Sobre a conta do Claude Code:${RESET}"
br
echo -e "  O Claude Code precisa de uma ${BOLD}conta na Anthropic${RESET} pra funcionar."
echo -e "  Crie a sua em: ${AMBER}${BOLD}https://claude.ai${RESET}"
br
echo -e "  ${GREEN}${BOLD}Boa notícia:${RESET} novos usuários ganham ${BOLD}30 dias grátis${RESET} do plano Pro!"
echo -e "  Isso inclui acesso completo ao Claude Code — sem pagar nada."
echo -e "  Depois dos 30 dias, o plano Pro custa US\$20/mês (~R\$115)."
br
tip "Sem a conta, o Claude Code até abre, mas não consegue responder nada."
tip "É como ter o app instalado mas sem internet — ele precisa da conta"
tip "pra se conectar com a inteligência artificial nos servidores da Anthropic."
br
vocab "Anthropic = a empresa que criou o Claude (a IA por trás de tudo)."

pause

# ─── Clone project ────────────────────────────────────────────────────────────
echo -e "  ${AMBER}${BOLD}── Passo 4 de 4: Baixando o projeto ──${RESET}"
br
echo -e "  Agora vou baixar os arquivos do Claude Code para Iniciantes pro seu computador."
br
echo -e "  ${BOLD}O que são esses arquivos?${RESET}"
tip "São as instruções que transformam o Claude Code em professor."
tip "Sem eles, o Claude Code é apenas uma IA genérica."
tip "Com eles, ele sabe te ensinar passo a passo."
br

DEFAULT_DIR="$HOME/claude-code-iniciantes"
echo -e "  Por padrão, vou salvar os arquivos aqui:"
echo -e "    ${AMBER}${BOLD}$DEFAULT_DIR${RESET}"
br

read -rp "$(echo -e "  Pode ser nessa pasta? ${BOLD}[S/n]${RESET} ")" USE_DEFAULT
USE_DEFAULT="${USE_DEFAULT:-s}"

if [[ "$USE_DEFAULT" =~ ^[nN]$ ]]; then
  br
  tip "Digite o caminho completo da pasta onde quer salvar."
  tip "Exemplo: /home/seunome/projetos/mentor"
  br
  read -rp "$(echo -e "  Caminho: ")" TARGET_INPUT
  TARGET_DIR="${TARGET_INPUT/#\~/$HOME}"
else
  TARGET_DIR="$DEFAULT_DIR"
fi

br
REPO_URL="https://github.com/Lucagdev/claude-code-iniciantes.git"

if [[ -d "$TARGET_DIR/.git" ]]; then
  ok "O projeto já está instalado nessa pasta."
  tip "Se quiser reinstalar, delete a pasta e rode o instalador de novo."
elif [[ -d "$TARGET_DIR" ]]; then
  warn "Essa pasta já existe, mas não parece ter o projeto completo."
  tip "Se quiser reinstalar do zero, delete a pasta e rode novamente."
else
  info "Baixando do GitHub..."
  tip "O GitHub é o maior site do mundo pra guardar código."
  tip "Estou copiando o projeto de lá pro seu computador."
  br

  if git clone "$REPO_URL" "$TARGET_DIR" 2>/dev/null; then
    ok "Projeto baixado com sucesso!"
    br
    vocab "git clone = copiar um projeto do GitHub pro seu computador."
    tip "É como fazer download de uma pasta, mas com todo o histórico incluso."
  else
    warn "Não consegui baixar do GitHub."
    tip "Isso pode ser problema de conexão. Criando a pasta vazia por enquanto."
    mkdir -p "$TARGET_DIR"
    br
    echo -e "  Quando a internet voltar, rode:"
    echo -e "    ${AMBER}git clone $REPO_URL $TARGET_DIR${RESET}"
  fi
fi

# ─── Done! ────────────────────────────────────────────────────────────────────
br
echo -e "  ${GREEN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "  ${GREEN}${BOLD}  Instalação concluída! Tudo pronto.                     ${RESET}"
echo -e "  ${GREEN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
br
echo -e "  ${BOLD}O que vai acontecer agora:${RESET}"
br
echo -e "  Vou abrir o Claude Code dentro da pasta do projeto."
echo -e "  Quando ele abrir, você vai ver um campo pra digitar."
br
echo -e "  Digite ${AMBER}${BOLD}/start${RESET} e aperte ENTER."
br
echo -e "  A IA vai te dar boas-vindas e começar a te guiar."
echo -e "  Pode conversar com ela normalmente, como se fosse uma pessoa."
echo -e "  Ela vai te ensinar tudo — sem pressa, no seu ritmo."
br
echo -e "  ${DIM}Dicas rápidas:${RESET}"
echo -e "  ${DIM}  /clear  = limpa a tela se ficar confuso${RESET}"
echo -e "  ${DIM}  /exit   = sai do Claude Code${RESET}"
echo -e "  ${DIM}  Ctrl+C  = também sai, a qualquer momento${RESET}"
br

echo -e "  ${DIM}─────────────────────────────────────────────────────${RESET}"
echo -e "  ${DIM}Claude Code para Iniciantes · por Lucas Duarte${RESET}"
echo -e "  ${DIM}Threads: threads.com/@lucasgduartee${RESET}"
echo -e "  ${DIM}GitHub:  github.com/Lucagdev${RESET}"
echo -e "  ${DIM}YouTube: @lucasgdev${RESET}"
echo -e "  ${DIM}─────────────────────────────────────────────────────${RESET}"
br

read -rp "$(echo -e "  ${BOLD}Vamos começar? ${AMBER}[S/n]${RESET} ")" LAUNCH
LAUNCH="${LAUNCH:-s}"

if [[ "$LAUNCH" =~ ^[nN]$ ]]; then
  br
  ok "Beleza! Quando quiser começar, abra o terminal e digite:"
  br
  echo -e "    ${AMBER}${BOLD}cd \"$TARGET_DIR\" && claude${RESET}"
  br
  echo -e "  Depois, lá dentro, digite ${AMBER}${BOLD}/start${RESET} pra começar."
  br
  echo -e "  ${DIM}Até logo! Boa sorte na jornada.${RESET}"
  br
else
  br
  info "Abrindo o Claude Code..."
  br
  tip "Se for sua primeira vez, ele vai pedir pra você fazer login."
  tip "Siga as instruções na tela — é bem simples!"
  br
  cd "$TARGET_DIR"
  exec claude
fi
