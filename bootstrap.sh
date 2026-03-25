#!/usr/bin/env bash
set -e

echo "===> Xcode CLI"
xcode-select --install || true

echo "===> Homebrew"
if ! command -v brew >/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv || /usr/local/bin/brew shellenv)"

echo "===> Brew bundle"
brew bundle --file=./Brewfile

echo "===> Oh My Zsh"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "===> ASDF"
if [ ! -d "$HOME/.asdf" ]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
fi

# garante load no shell
grep -q asdf.sh ~/.zshrc || echo '. "$HOME/.asdf/asdf.sh"' >>~/.zshrc

source ~/.asdf/asdf.sh

asdf plugin add ruby || true
asdf plugin add nodejs || true
asdf plugin add python || true
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring || true

echo "===> Install runtimes"
cp asdf/.tool-versions ~/.tool-versions
asdf install

echo "===> Corepack"
corepack enable || true

echo "===> Services"
brew services start postgresql || true
brew services start redis || true

echo "===> Docker"
open -a Docker || true

echo "===> Apply dotfiles"
bash ./install.sh

echo "===> Done. Restart terminal."
