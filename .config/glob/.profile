# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#export PATH=${PATH:+:${PATH}}
export PATH="$HOME/.cargo/bin:$HOME/.scripts:$PATH"

# Libs
#export LD_LIBRARY_PATH=/usr/local/cuda-9.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# Read profile file
test -z "$PROFILEREAD" && . /etc/profile || true

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_MESSAGES="C"

export XDG_CONFIG_HOME="$HOME/.config"
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# man path
# export MANPATH="/usr/local/man:$MANPATH"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# setup layouts
setxkbmap -model pc104 -layout us,ru -variant , -option grp:alt_shift_toggle
# xmodmap -e \"clear lock\";xmodmap -e \"keysym Caps_Lock = Escape\";

export PACTL_SINK=$(pactl list short sinks | grep analog | cut -f1)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


# Alias
alias v="nvim"
alias vim="vim"
alias vi="nvim"
alias nv="nvim"
alias images="nomacs"
alias fancy_wallpaper="~/.config/i3/wallpaper/run.sh"


if [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep i3 || startx
fi
