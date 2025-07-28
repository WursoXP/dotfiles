#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


export LS_COLORS="di=01;36:ln=01;35:ex=01;32:bd=01;34:cd=01;34:pi=01;33:so=01;33:su=01;31:sg=01;31:tw=01;34:ow=01;34:mi=01;31:or=01;31:ca=01;37:mh=00:cl=01;37:st=01;37"
