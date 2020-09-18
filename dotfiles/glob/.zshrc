# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

[[ -f ~/.profile ]] && . ~/.profile
[[ -f ~/.config/zsh/themes_config.zsh ]] && . ~/.config/zsh/themes_config.zsh
[[ -f ~/.config/zsh/.fzf.zsh ]] && source ~/.config/zsh/.fzf.zsh

HIST_STAMPS="mm/dd/yyyy"

plugins=(
  git
  npm
  sudo
  zsh-autosuggestions
  zsh-syntax-highlighting
  virtualenv
  alias-finder
  docker-compose
  fzf
)

ZSH_THEME_RANDOM_CANDIDATES=(
  "geometry/geometry"
  "pi"
)

ZSH_THEME=random

source $ZSH/oh-my-zsh.sh

# Zsh highlight configuration
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor line)

ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=green
ZSH_HIGHLIGHT_STYLES[line]=bold
ZSH_HIGHLIGHT_STYLES[path]=fg=cyan,underline
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
ZSH_HIGHLIGHT_STYLES[default]=fg=red,underline
ZSH_HIGHLIGHT_STYLES[cursor]=bg=transparent

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'


# aliases
alias editconfig="nvim ~/.zshrc"
alias loadconfig="source ~/.zshrc"
