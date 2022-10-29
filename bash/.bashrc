#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# convenience aliases
alias ll='ls -al'
alias lvim="~/.local/bin/lvim"
alias gp="git push"

fish
