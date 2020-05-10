# Setup fzf
# ---------
if [[ ! "$PATH" == */home/vlad/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/vlad/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/vlad/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/vlad/.fzf/shell/key-bindings.zsh"
