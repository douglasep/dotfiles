#!/usr/bin/env bash
set -e

echo "===> ZSH"
cp zsh/.zshrc ~/.zshrc

echo "===> Ghostty"
mkdir -p ~/.config/ghostty
cp ghostty/config ~/.config/ghostty/config

echo "===> Starship"
mkdir -p ~/.config
cp starship/starship.toml ~/.config/starship.toml

echo "===> Neovim"
rm -rf ~/.config/nvim
cp -R nvim ~/.config/

echo "===> VSCode"
VSCODE="$HOME/Library/Application Support/Code/User"
mkdir -p "$VSCODE"
cp vscode/settings.json "$VSCODE/"
cp vscode/keybindings.json "$VSCODE/"

echo "===> Git"
cp git/.gitconfig ~/.gitconfig

echo "===> Done dotfiles"
