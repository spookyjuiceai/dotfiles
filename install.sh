#!/usr/bin/env zsh
# install.sh — bootstrap SJ agent machine from dotfiles repo
set -e

DOTFILES="$( cd "$( dirname "$0" )" && pwd )"
echo "Installing dotfiles from $DOTFILES"

link() {
  local src="$DOTFILES/$1"
  local dst="$2"
  mkdir -p "$(dirname "$dst")"
  ln -sf "$src" "$dst"
  echo "  linked $dst"
}

link .zshrc        ~/.zshrc
link .zprofile     ~/.zprofile
link starship.toml ~/.config/starship.toml
link .gitconfig    ~/.gitconfig
link CLAUDE.md     ~/.claude/CLAUDE.md

# Secrets scaffold
if [[ ! -f ~/.config/sj/secrets.zsh ]]; then
  mkdir -p ~/.config/sj
  cp "$DOTFILES/secrets.zsh.example" ~/.config/sj/secrets.zsh
  chmod 600 ~/.config/sj/secrets.zsh
  echo "  created ~/.config/sj/secrets.zsh — fill in your tokens"
fi

echo ""
echo "Done. Next steps:"
echo "  1. Edit ~/.config/sj/secrets.zsh with real tokens"
echo "  2. Run: gh auth login"
echo "  3. Run: sudo env PATH=\$PATH:/opt/homebrew/Cellar/node/25.8.0/bin \\"
echo "       /opt/homebrew/lib/node_modules/pm2/bin/pm2 startup launchd -u sj --hp /Users/sj"
echo "  4. Run: openclaw onboard --install-daemon"
