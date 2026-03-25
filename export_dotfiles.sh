#!/usr/bin/env bash
set -e

DEST="$HOME/onboard/dotfiles"

echo "===> Creating export folder"
rm -rf "$DEST"
mkdir -p "$DEST"

echo "===> ZSH"
cp ~/.zshrc "$DEST/" 2>/dev/null || true
cp ~/.zprofile "$DEST/" 2>/dev/null || true

echo "===> Ghostty"
mkdir -p "$DEST/ghostty"
cp ~/.config/ghostty/config "$DEST/ghostty/" 2>/dev/null || true

echo "===> Starship"
mkdir -p "$DEST/starship"
cp ~/.config/starship.toml "$DEST/starship/" 2>/dev/null || true

echo "===> Neovim"
mkdir -p "$DEST/nvim"
cp -R ~/.config/nvim/* "$DEST/nvim/" 2>/dev/null || true

echo "===> VSCode"
VSCODE="$HOME/Library/Application Support/Code/User"
mkdir -p "$DEST/vscode"
cp "$VSCODE/settings.json" "$DEST/vscode/" 2>/dev/null || true
cp "$VSCODE/keybindings.json" "$DEST/vscode/" 2>/dev/null || true

echo "===> Git"
cp ~/.gitconfig "$DEST/" 2>/dev/null || true

echo "===> ASDF"
cp ~/.tool-versions "$DEST/" 2>/dev/null || true

echo "===> Done: $DEST"
