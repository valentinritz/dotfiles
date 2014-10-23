#
# ~/.bashrc
#

##################################################
# Bash Config
##################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias prompt='$HOME/Apps/scripts/infos.sh'

# Enable vi mode
set -o vi

# Autocomplete with tab
bind 'TAB:menu-complete'

# Default editor when using urxvt
export EDITOR="vim"

# GTK theme, usefull for qt apps
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# ruby thing
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

##################################################
# Bash Style
##################################################

# Prompt
# Check for an interactive session
# [ -z "$PS1" ] && return

# Prompt un peu nul

PS1="\[\033[1;34m\] \W \[\033[0m\]"
