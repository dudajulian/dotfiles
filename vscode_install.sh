#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

# PPA
sudo add-apt-repository -y ppa:neovim-ppa/unstable

# packages (comments in the list are ignored)
sudo apt-get update
sed 's/#.*//' "$DEVSETUP/apt-packages.txt" | xargs -r sudo apt-get install -y

# Ubuntu installs fd as "fdfind"
mkdir -p ~/.local/bin
ln -sf "$(command -v fdfind)" ~/.local/bin/fd

# Oh My Zsh (cloned directly so it doesn't overwrite .zshrc)
# [ -d ~/.oh-my-zsh ] || git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

# dotfiles
# link .zshrc                     ~/.zshrc
link .tmux.conf                 ~/.tmux.conf
# link ghostty                    ~/.config/ghostty
link nvim               	~/.config/nvim
# link .gitconfig			~/.gitconfig

