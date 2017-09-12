# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true

#export PS1="\[$(tput bold)\]\[\033[38;5;216m\]\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;15m\]\[$(tput sgr0)\]\[\033[38;5;216m\]\[$(tput bold)\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;81m\][\w]\[$(tput sgr0)\]\[\033[38;5;208m\]\n\n--->\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

git_branch() {
	echo -e "\033[38;5;216m$(git branch 2>/dev/null | grep '^*' | sed s/..//)"
}

wc() {
	echo -e "\033[38;5;15m"
}
cc() {
	echo -e "\033[38;5;51m"
}

prompt() {
    PS1=$(printf "\n%*s\r\033[38;5;208m\]--->\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]" "$(tput cols)" '\033[38;5;216m\]\[$(tput bold)\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput bold)\]\[\033[38;5;81m\][\w\]]')

	PS1='$(printf "\033[38;5;51m%*s\r%s" $(( COLUMNS-1 )) "\w" "$(git_branch)$(cc)\n ⇄ $(wc)")'
}
PROMPT_COMMAND=prompt

#function _update_ps1() {
#    PS1="$(~/powerline-shell.py $? 2> /dev/null)"
#}

#if [ "$TERM" != "linux" ]; then
#    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi

alias brightness='xbacklight'
alias chi3='vim ~/.config/i3/config'

#alias xampp='/opt/lampp/manager-linux-x64.run'
#alias setgrtlib='export LD_LIBRARY_PATH=/home/vlad/projects/brainhub/stable/s/gestusSDK/externAssets/grt/lib:${LD_LIBRARY_PATH}'

#PATH=$PATH:/home/vlad/.gem/ruby/2.1.0/:/usr/lib64/ruby/gems/2.1.0/
