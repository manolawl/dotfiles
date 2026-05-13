#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='rg --color=auto'
alias firefox='zen-browser'
PS1='[\u@\h \W]\$ '

export EDITOR=vim
