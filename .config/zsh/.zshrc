[[ -f ~/.profile ]] && . ~/.profile


# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="geometry/geometry"

# geometry theme config
GEOMETRY_PROMPT_PLUGINS=(virtualenv git hg node)

GEOMETRY_GIT_SYMBOL_REBASE="\uE0A0"
GEOMETRY_GIT_SYMBOL_STASHES=x
GEOMETRY_GIT_COLOR_STASHES=blue
GEOMETRY_GIT_GREP=ack
GEOMETRY_GIT_NO_COMMITS_MESSAGE="no commits"
GEOMETRY_GIT_TIME_DETAILED=true

GEOMETRY_SYMBOL_GIT_DIRTY=
GEOMETRY_SYMBOL_GIT_CLEAN=

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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

source $ZSH/oh-my-zsh.sh


# aliases
alias editconfig="nvim ~/.zshrc"
alias loadconfig="source ~/.zshrc"

# Zsh highlight configuration
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor line)

ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=green
ZSH_HIGHLIGHT_STYLES[line]=bold
ZSH_HIGHLIGHT_STYLES[path]=fg=157,underline
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
ZSH_HIGHLIGHT_STYLES[default]=fg=red,underline
ZSH_HIGHLIGHT_STYLES[cursor]=bg=transparent

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
