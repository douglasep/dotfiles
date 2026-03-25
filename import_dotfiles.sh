#!/usr/bin/env bash
set -e

SRC="$HOME/dotfiles_export"

echo "===> Restoring ZSH"
cp "$SRC/.zshrc" ~ 2>/dev/null || true
cp "$SRC/.zprofile" ~ 2>/dev/null || true

echo "===> Ghostty"
mkdir -p ~/.config/ghostty
cp "$SRC/ghostty/config" ~/.config/ghostty/ 2>/dev/null || true

echo "===> Starship"
mkdir -p ~/.config
cp "$SRC/starship/starship.toml" ~/.config/ 2>/dev/null || true

echo "===> Neovim"
mkdir -p ~/.config/nvim
cp -R "$SRC/nvim/"* ~/.config/nvim/ 2>/dev/null || true

echo "===> VSCode"
VSCODE="$HOME/Library/Application Support/Code/User"
mkdir -p "$VSCODE"
cp "$SRC/vscode/settings.json" "$VSCODE/" 2>/dev/null || true
cp "$SRC/vscode/keybindings.json" "$VSCODE/" 2>/dev/null || true

echo "===> Git"
cp "$SRC/.gitconfig" ~ 2>/dev/null || true

echo "===> ASDF"
cp "$SRC/.tool-versions" ~ 2>/dev/null || true

echo "===> Done"
