# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# ASDF (antes de qualquer runtime usage)
. "$HOME/.asdf/asdf.sh"

# Starship prompt
eval "$(starship init zsh)"

# Direnv (important for projects)
eval "$(direnv hook zsh)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# PATH fixes
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Editor
export EDITOR="nvim"

# Aliases
alias ls="eza --icons"
alias cat="bat"
alias rspec="bundle exec rspec"

# Optional: flyctl (keep if needed)
export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
