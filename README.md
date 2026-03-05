# SJ Agent Machine — Dotfiles

Mac Studio setup for Spooky Juice autonomous agent environment.

## What's tracked

| File | Destination |
|------|-------------|
| `.zshrc` | `~/.zshrc` |
| `.zprofile` | `~/.zprofile` |
| `starship.toml` | `~/.config/starship.toml` |
| `.gitconfig` | `~/.gitconfig` |
| `claude-settings.json` | `~/.claude/settings.json` |
| `CLAUDE.md` | `~/.claude/CLAUDE.md` |

## Install (fresh machine)

```zsh
git clone https://github.com/spookyjuiceai/dotfiles ~/dev/dotfiles
cd ~/dev/dotfiles
./install.sh
```

## Stack

- **Claude Code** v2.1.69 — Homebrew Cask
- **OpenClaw** — messaging gateway daemon
- **Node.js** v25.8.0 — Homebrew
- **Python** 3.12 — Homebrew
- **Bun** 1.3.10
- **Redis** — launchd service (port 6379)
- **PM2** — process manager for agent processes

## MCP Servers

| Name | Purpose |
|------|---------|
| filesystem | Read/write ~/sj |
| memory | Persistent knowledge graph |
| sequential-thinking | Multi-step reasoning |
| github | github.com/spookyjuiceai |
| obsidian | ~/Documents/Obsidian Vault |
| fetch | Outbound HTTP |

## Manual steps after fresh install

```zsh
# 1. Add secrets
cp secrets.zsh.example ~/.config/sj/secrets.zsh
# Edit ~/.config/sj/secrets.zsh with real tokens

# 2. Authenticate GitHub CLI
gh auth login

# 3. PM2 startup (requires sudo)
sudo env PATH=$PATH:/opt/homebrew/Cellar/node/25.8.0/bin \
  /opt/homebrew/lib/node_modules/pm2/bin/pm2 startup launchd -u sj --hp /Users/sj

# 4. Run OpenClaw onboarding
openclaw onboard --install-daemon
```
