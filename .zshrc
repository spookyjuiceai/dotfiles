# ~/.zshrc — interactive shell config for SJ (Spooky Juice) agent machine

# ── Homebrew ────────────────────────────────────────────────────────────────
# Ensure brew is always available regardless of login vs interactive shell
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv zsh)"
fi

# ── PATH ────────────────────────────────────────────────────────────────────
export PATH="$HOME/.local/bin:$HOME/.bun/bin:$PATH"

# Python 3.12 (Homebrew) — takes precedence over Apple system Python
export PATH="/opt/homebrew/opt/python@3.12/libexec/bin:$PATH"

# ── Bun ─────────────────────────────────────────────────────────────────────
export BUN_INSTALL="$HOME/.bun"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# ── Editor ──────────────────────────────────────────────────────────────────
export EDITOR="nano"
export VISUAL="nano"

# ── History ─────────────────────────────────────────────────────────────────
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE SHARE_HISTORY HIST_VERIFY

# ── Completions ─────────────────────────────────────────────────────────────
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ── fzf ─────────────────────────────────────────────────────────────────────
[ -f /opt/homebrew/opt/fzf/shell/completion.zsh ] && source /opt/homebrew/opt/fzf/shell/completion.zsh
[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ] && source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# ── zoxide (smart cd) ───────────────────────────────────────────────────────
eval "$(zoxide init zsh)"

# ── Starship prompt ─────────────────────────────────────────────────────────
eval "$(starship init zsh)"

# ── Aliases — navigation ────────────────────────────────────────────────────
alias ls='eza --icons --group-directories-first'
alias ll='eza -la --icons --group-directories-first --git'
alias lt='eza --tree --icons --level=2'
alias cat='bat --paging=never'
alias cd='z'

# ── Aliases — git ───────────────────────────────────────────────────────────
alias g='git'
alias gs='git status -sb'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate -20'
alias gd='git diff'

# ── Aliases — dev ───────────────────────────────────────────────────────────
alias n='node'
alias py='python3'
alias pm='pm2'
alias pml='pm2 list'
alias pmlog='pm2 logs'

# ── Aliases — OpenClaw ──────────────────────────────────────────────────────
alias oc='openclaw'
alias ocl='openclaw logs'
alias ocs='openclaw status'

# ── Aliases — Claude Code ───────────────────────────────────────────────────
alias cc='claude'
alias ccc='claude --continue'

# ── Redis ───────────────────────────────────────────────────────────────────
alias redis='redis-cli'

# ── tmux ────────────────────────────────────────────────────────────────────
alias ta='tmux attach || tmux new-session -s main'
alias tl='tmux list-sessions'
alias tn='tmux new-session -s'

# ── Git delta pager ─────────────────────────────────────────────────────────
export GIT_PAGER='delta'

# ── Secrets (not tracked in git) ────────────────────────────────────────────
[[ -f "$HOME/.config/sj/secrets.zsh" ]] && source "$HOME/.config/sj/secrets.zsh"

# ── Obsidian path ───────────────────────────────────────────────────────────
export PATH="$PATH:/Applications/Obsidian.app/Contents/MacOS"
export OBSIDIAN_VAULT="$HOME/Documents/Obsidian Vault"
