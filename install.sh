#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

# packages (comments in the list are ignored)
sudo apt-get update
sed 's/#.*//' "$DEVSETUP/apt-packages.txt" | xargs -r sudo apt-get install -y

# Ubuntu installs fd as "fdfind"
mkdir -p ~/.local/bin
ln -sf "$(command -v fdfind)" ~/.local/bin/fd

# Oh My Zsh (cloned directly so it doesn't overwrite .zshrc)
[ -d ~/.oh-my-zsh ] || git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

# dotfiles
link zsh/.zshrc                       ~/.zshrc
link tmux/.tmux.conf                  ~/.tmux.conf
link ghostty/config.ghostty           ~/.config/ghostty/config.ghostty
# link nvim/.config/nvim              ~/.config/nvim   # enable once the directory exists in the repo

# nvim as default editor: add the update-alternatives commands from setdefault.md here

