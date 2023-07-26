# I use oh-my-zsh

export ZSH="$HOME/.oh-my-zsh"
HYPHEN_INSENSITIVE="true"

plugins=(
  git
  dotenv
  npm 
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

#Aliases
alias btop="btop --utf-force"
alias Syu="sudo pacman -Syu"
alias lg="lazygit"
alias tm="~/termux.sh"

# Starship
eval "$(starship init zsh)"

export PATH="/home/nived/.local/bin/:$PATH"
export CHROME_EXECUTABLE="/usr/bin/brave"
export PATH="/opt/flutter/bin:$PATH"
