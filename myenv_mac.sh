#!/usr/bin/env bash

set -e

echo "===> Installing Xcode CLI tools"
xcode-select --install || true

echo "===> Installing Homebrew"
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "===> Updating brew"
brew update

echo "===> Core packages"
brew install \
  git \
  neovim \
  fzf \
  ripgrep \
  fd \
  bat \
  eza \
  tmux \
  htop \
  btop \
  lazygit \
  gh \
  direnv \
  overmind \
  imagemagick \
  libvips \
  postgresql \
  redis \
  docker \
  docker-compose \
  pgcli \
  httpie

echo "===> Install Ghostty"
brew install --cask ghostty

echo "===> Install VSCode"
brew install --cask visual-studio-code

echo "===> Install Chrome"
brew install --cask google-chrome

echo "===> Setup ZSH + Oh My Zsh"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "===> Install Starship"
brew install starship

if ! grep -q "starship init zsh" ~/.zshrc; then
  echo 'eval "$(starship init zsh)"' >> ~/.zshrc
fi

echo "===> Install ASDF"
if [ ! -d "$HOME/.asdf" ]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
fi

if ! grep -q ".asdf/asdf.sh" ~/.zshrc; then
  echo '. "$HOME/.asdf/asdf.sh"' >> ~/.zshrc
fi

source "$HOME/.asdf/asdf.sh"

echo "===> Add ASDF plugins"
asdf plugin add ruby || true
asdf plugin add nodejs || true
asdf plugin add python || true

echo "===> Install runtimes"
asdf install ruby latest
asdf global ruby latest

asdf install nodejs latest
asdf global nodejs latest

asdf install python latest
asdf global python latest

echo "===> Install global npm packages"
npm install -g yarn pnpm

echo "===> Setup PostgreSQL"
brew services start postgresql

echo "===> Setup Redis"
brew services start redis

echo "===> Setup Docker"
open -a Docker || true

echo "===> Install LazyVim"
if [ ! -d "$HOME/.config/nvim" ]; then
  git clone https://github.com/LazyVim/starter ~/.config/nvim
fi

echo "===> Done. Restart terminal."
