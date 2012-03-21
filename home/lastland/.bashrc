#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export CLOJURE_EXT=~/.clojure
export PATH=$PATH:~/opt/clojure-contrib/lauchers/bash
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias l='ls'
alias la='ls -a'
alias ll='ls -al'
alias python='python2'
alias py='python'
alias rb='ruby'
alias v='vim'
alias gcc='gcc -Wall -g -p'
alias cx='chmod a+x'
PS1='[\u@\h \W]\$ '
