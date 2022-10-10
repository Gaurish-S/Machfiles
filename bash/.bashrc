#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# convenience aliases
alias ll='ls -al'

# thingo
neofetch

export ROS_DOMAIN_ID=42
source /opt/ros2/galactic/setup.bash
