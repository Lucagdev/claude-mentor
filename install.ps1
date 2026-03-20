# Claude Code para Iniciantes — Instalador para Windows
# Execute com: irm https://raw.githubusercontent.com/Lucagdev/claude-code-iniciantes/main/install.ps1 | iex

$ErrorActionPreference = "Stop"

function Write-Color($text, $color = "White") {
    Write-Host $text -ForegroundColor $color
}

function Write-Info($text)    { Write-Host "  i  $text" -ForegroundColor Yellow }
function Write-Ok($text)      { Write-Host "  ✓  $text" -ForegroundColor Green }
function Write-Warn($text)    { Write-Host "  !  $text" -ForegroundColor Yellow }
function Write-Fail($text)    { Write-Host "  ✗  $text" -ForegroundColor Red }
function Write-Tip($text)     { Write-Host "     $text" -ForegroundColor DarkGray }
function Write-Vocab($text)   { Write-Host "     Vocabulário: $text" -ForegroundColor DarkYellow }

# ─── Banner ───────────────────────────────────────────────────────────────────
Clear-Host
Write-Color @"

   _____ _                 _        __  __            _
  / ____| |               | |      |  \/  |          | |
 | |    | | __ _ _   _  __| | ___  | \  / | ___ _ __ | |_ ___  _ __
 | |    | |/ _`` | | | |/ _`` |/ _ \ | |\/| |/ _ \ '_ \| __/ _ \| '__|
 | |____| | (_| | |_| | (_| |  __/ | |  | |  __/ | | | || (_) | |
  \_____|_|\__,_|\__,_|\__,_|\___| |_|  |_|\___|_| |_|\__\___/|_|

"@ Yellow

Write-Host "  ────────────────────────────────────────────────────"
Write-Host "  por Lucas Duarte" -ForegroundColor White
Write-Tip "Threads: threads.com/@lucasgduartee"
Write-Tip "GitHub:  github.com/Lucagdev"
Write-Tip "YouTube: youtube.com/@lucasgdev"
Write-Host "  ────────────────────────────────────────────────────"
Write-Host ""
Write-Color "  Olá! Bem-vindo ao instalador do Claude Code para Iniciantes." White
Write-Host ""
Write-Host "  Eu sou um script que vai preparar tudo no seu computador"
Write-Host "  pra você começar a aprender programação com inteligência artificial."
Write-Host ""
Write-Host "  O que vai acontecer aqui:"
Write-Host "    1. Vou verificar o que já tem instalado no seu PC"
Write-Host "    2. Se faltar algo, instalo pra você (com sua permissão)"
Write-Host "    3. Baixo os arquivos do projeto"
Write-Host "    4. Abro a IA pra você começar a conversar com ela"
Write-Host ""
Write-Tip "Não se preocupe — vou explicar tudo que estiver acontecendo."
Write-Tip "Se algo der errado, vou te dizer exatamente o que fazer."
Write-Host ""
Read-Host "     Aperte ENTER quando estiver pronto..."

# ─── Passo 1: Sistema ─────────────────────────────────────────────────────────
Write-Host ""
Write-Color "  ── Passo 1 de 4: Conhecendo seu computador ──" Cyan
Write-Host ""
Write-Ok "Você está usando Windows."
Write-Tip "O Claude Code funciona nativamente no Windows — ótimo!"
Write-Vocab "Windows = o sistema operacional do seu computador."

# ─── Passo 2: Ferramentas ────────────────────────────────────────────────────
Write-Host ""
Write-Color "  ── Passo 2 de 4: Verificando ferramentas ──" Cyan
Write-Host ""
Write-Host "  Agora vou verificar se você tem 2 programas essenciais."
Write-Host "  Se algum estiver faltando, instalo pra você."
Write-Host ""

# --- Git ---
Write-Host "  Ferramenta 1/2: git" -ForegroundColor White
if (Get-Command git -ErrorAction SilentlyContinue) {
    Write-Ok "git já está instalado."
} else {
    Write-Info "git não encontrado. Vou instalar."
    Write-Host ""
    Write-Host "  O que é o git?" -ForegroundColor White
    Write-Tip "O git é o programa mais importante do mundo da programação."
    Write-Tip "Ele guarda o histórico de tudo que você faz num projeto —"
    Write-Tip "como um 'ctrl+z' infinito que nunca esquece nada."
    Write-Vocab "git = sistema de controle de versão."
    Write-Host ""
    Write-Info "Baixando e instalando o git..."
    Write-Tip "Buscando a versão mais recente..."
    Write-Host ""

    $gitInstalled = $false

    try {
        # Get latest Git for Windows release from GitHub API
        $release = Invoke-RestMethod "https://api.github.com/repos/git-for-windows/git/releases/latest"
        $asset = $release.assets | Where-Object { $_.name -match 'Git-.*-64-bit\.exe$' } | Select-Object -First 1

        if ($asset) {
            $installerPath = "$env:TEMP\git-installer.exe"
            Write-Tip "Baixando $($asset.name)..."
            Invoke-WebRequest -Uri $asset.browser_download_url -OutFile $installerPath

            Write-Tip "Instalando... (isso pode levar um minuto)"
            Start-Process -FilePath $installerPath -ArgumentList '/VERYSILENT','/NORESTART' -Wait

            $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
            if (Get-Command git -ErrorAction SilentlyContinue) {
                $gitInstalled = $true
                Write-Ok "git instalado com sucesso!"
            }

            Remove-Item $installerPath -ErrorAction SilentlyContinue
        }
    } catch {
        # Download or install failed
    }

    if (-not $gitInstalled) {
        Write-Warn "Não consegui instalar automaticamente."
        Write-Host ""
        Write-Host "  Sem problema! Vou te ajudar a instalar manualmente." -ForegroundColor White
        Write-Host ""
        Write-Host "  1. Abra este link no navegador:" -ForegroundColor White
        Write-Host "     https://git-scm.com/download/win" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "  2. Baixe e instale (pode clicar 'Next' em tudo)" -ForegroundColor White
        Write-Host ""
        Write-Host "  3. Quando terminar, volte aqui e aperte ENTER" -ForegroundColor White
        Write-Host ""
        Write-Tip "Não precisa fechar esta janela — só volte aqui quando terminar."

        while ($true) {
            Read-Host "`n     Aperte ENTER depois de instalar o git..."
            $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
            if (Get-Command git -ErrorAction SilentlyContinue) {
                Write-Ok "git encontrado! Vamos continuar."
                break
            }
            Write-Warn "Ainda não encontrei o git."
            Write-Tip "Verifique se a instalação terminou e tente de novo."
        }
    }
}

Write-Host ""

# --- Claude Code ---
Write-Host "  Ferramenta 2/2: Claude Code" -ForegroundColor White
if (Get-Command claude -ErrorAction SilentlyContinue) {
    Write-Ok "Claude Code já está instalado!"
} else {
    Write-Info "Claude Code não encontrado. Vou instalar."
    Write-Host ""
    Write-Host "  O que é o Claude Code?" -ForegroundColor White
    Write-Tip "O Claude Code é uma inteligência artificial criada pela empresa Anthropic."
    Write-Tip "Diferente do ChatGPT ou do Claude no navegador, ele roda aqui — no terminal."
    Write-Tip "Isso significa que ele pode ler seus arquivos, escrever código,"
    Write-Tip "executar programas e te ajudar a construir coisas de verdade."
    Write-Host ""
    Write-Tip "Pense nele como um programador muito experiente"
    Write-Tip "sentado do seu lado, pronto pra te ajudar."
    Write-Host ""
    Write-Vocab "Terminal = essa tela preta onde você está agora."
    Write-Tip "Também chamado de 'prompt', 'console' ou 'linha de comando'."
    Write-Host ""
    Write-Info "Baixando e instalando... (pode levar alguns segundos)"

    $claudeInstalled = $false
    try {
        irm https://claude.ai/install.ps1 | iex
        $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

        if (Get-Command claude -ErrorAction SilentlyContinue) {
            $claudeInstalled = $true
            Write-Ok "Claude Code instalado com sucesso!"
        }
    } catch {
        # Installation script failed
    }

    if (-not $claudeInstalled) {
        Write-Warn "Não consegui detectar o Claude Code automaticamente."
        Write-Host ""
        Write-Host "  Sem problema! Vou te ajudar:" -ForegroundColor White
        Write-Host ""
        Write-Host "  1. Abra outra aba do terminal (PowerShell)" -ForegroundColor White
        Write-Host "  2. Cole este comando lá:" -ForegroundColor White
        Write-Host "     irm https://claude.ai/install.ps1 | iex" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "  3. Quando terminar, volte aqui e aperte ENTER" -ForegroundColor White
        Write-Host ""
        Write-Tip "Não precisa fechar esta janela — só volte aqui quando terminar."

        while ($true) {
            Read-Host "`n     Aperte ENTER depois de instalar o Claude Code..."
            $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
            if (Get-Command claude -ErrorAction SilentlyContinue) {
                Write-Ok "Claude Code encontrado! Vamos continuar."
                break
            }
            Write-Warn "Ainda não encontrei o Claude Code."
            Write-Tip "Verifique se a instalação terminou e tente de novo."
        }
    }
}

Write-Host ""
Write-Host "  Sobre a conta do Claude Code:" -ForegroundColor Yellow
Write-Host ""
Write-Host "  O Claude Code precisa de uma conta na Anthropic pra funcionar."
Write-Host "  Crie a sua em: " -NoNewline; Write-Color "https://claude.ai" Cyan
Write-Host ""
Write-Color "  Boa notícia: novos usuários ganham 30 dias grátis do plano Pro!" Green
Write-Host "  Isso inclui acesso completo ao Claude Code — sem pagar nada."
Write-Host ""
Write-Tip "Sem a conta, o Claude Code até abre, mas não consegue responder nada."
Write-Vocab "Anthropic = a empresa que criou o Claude (a IA por trás de tudo)."
Write-Host ""
Read-Host "     Aperte ENTER quando estiver pronto..."

# ─── Passo 3: Baixar projeto ────────────────────────────────────────────────
Write-Host ""
Write-Color "  ── Passo 3 de 4: Baixando o projeto ──" Cyan
Write-Host ""
Write-Host "  Agora vou baixar os arquivos do Claude Code para Iniciantes pro seu computador."
Write-Host ""
Write-Host "  O que são esses arquivos?" -ForegroundColor White
Write-Tip "São as instruções que transformam o Claude Code em professor."
Write-Tip "Sem eles, o Claude Code é apenas uma IA genérica."
Write-Tip "Com eles, ele sabe te ensinar passo a passo."
Write-Host ""

$DefaultDir = Join-Path $HOME "claude-code-iniciantes"
Write-Host "  Por padrão, vou salvar os arquivos aqui:"
Write-Color "    $DefaultDir" Cyan
Write-Host ""

$choice = Read-Host "  Pode ser nessa pasta? [S/n]"
if ($choice -eq '' -or $choice -match '^[sS]$') {
    $TargetDir = $DefaultDir
} else {
    $TargetDir = Read-Host "  Caminho"
}

$RepoUrl = "https://github.com/Lucagdev/claude-code-iniciantes.git"

if (Test-Path (Join-Path $TargetDir ".git")) {
    Write-Ok "O projeto já está instalado nessa pasta."
} elseif (Test-Path $TargetDir) {
    Write-Warn "Essa pasta já existe."
    Write-Tip "Se quiser reinstalar, delete a pasta e rode novamente."
} else {
    Write-Info "Baixando do GitHub..."
    Write-Tip "O GitHub é o maior site do mundo pra guardar código."
    Write-Tip "Estou copiando o projeto de lá pro seu computador."
    Write-Host ""

    $ErrorActionPreference = "Continue"
    $cloneOutput = git clone $RepoUrl $TargetDir 2>&1
    $ErrorActionPreference = "Stop"
    if ($LASTEXITCODE -eq 0) {
        Write-Ok "Projeto baixado com sucesso!"
        Write-Vocab "git clone = copiar um projeto do GitHub pro seu computador."
    } else {
        Write-Warn "Não consegui baixar do GitHub."
        Write-Tip "$cloneOutput"
        Write-Host ""
        Write-Tip "Criando pasta vazia..."
        New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
    }
}

# ─── Passo 4: Finalizar ─────────────────────────────────────────────────────
Write-Host ""
Write-Host "  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Green
Write-Host "    Instalação concluída! Tudo pronto.                     " -ForegroundColor Green
Write-Host "  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Green
Write-Host ""
Write-Host "  O que vai acontecer agora:" -ForegroundColor White
Write-Host ""
Write-Host "  Vou abrir o Claude Code dentro da pasta do projeto."
Write-Host "  Quando ele abrir, você vai ver um campo pra digitar."
Write-Host ""
Write-Host "  Digite " -NoNewline; Write-Color "/start" Cyan; Write-Host " e aperte ENTER."
Write-Host ""
Write-Host "  A IA vai te dar boas-vindas e começar a te guiar."
Write-Host "  Pode conversar com ela normalmente, como se fosse uma pessoa."
Write-Host ""
Write-Tip "Dicas rápidas:"
Write-Tip "  /clear  = limpa a tela se ficar confuso"
Write-Tip "  /exit   = sai do Claude Code"
Write-Tip "  Ctrl+C  = também sai, a qualquer momento"
Write-Host ""
Write-Host "  ────────────────────────────────────────────────────" -ForegroundColor DarkGray
Write-Host "  Claude Code para Iniciantes · por Lucas Duarte" -ForegroundColor DarkGray
Write-Tip "Threads: threads.com/@lucasgduartee"
Write-Tip "GitHub:  github.com/Lucagdev"
Write-Tip "YouTube: youtube.com/@lucasgdev"
Write-Host "  ────────────────────────────────────────────────────" -ForegroundColor DarkGray
Write-Host ""

$launch = Read-Host "  Vamos começar? [S/n]"
if ($launch -eq 'n' -or $launch -eq 'N') {
    Write-Host ""
    Write-Ok "Beleza! Quando quiser começar, abra o PowerShell e digite:"
    Write-Host ""
    Write-Color "    cd `"$TargetDir`"; claude" Cyan
    Write-Host ""
    Write-Host "  Depois, lá dentro, digite " -NoNewline; Write-Color "/start" Cyan; Write-Host " pra começar."
    Write-Host ""
} else {
    Write-Host ""
    Write-Info "Abrindo o Claude Code..."
    Write-Tip "Se for sua primeira vez, ele vai pedir pra você fazer login."
    Write-Tip "Siga as instruções na tela — é bem simples!"
    Write-Host ""
    Set-Location $TargetDir
    claude
}
