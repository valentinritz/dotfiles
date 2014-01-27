#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#Options
zstyle ':completion:*' menu select
setopt histignorealldups sharehistory

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

autoload -U colors && colors
autoload -U compinit

compinit

bindkey -v
# export EDITOR="vim"
export EDITOR="gvim"

# PATH
PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH"

#Alias
alias ink='$HOME/Apps/inkddg.sh'
alias prompt='$HOME/Apps/infos.sh'

alias addon-sdk="cd /opt/addon-sdk && source bin/activate; cd -"
# alias xtra='sudo netctl stop unifr | sudo netctl start xtra'
# alias unifr='sudo netctl stop xtra | sudo netctl start unifr'

#Theme
# PROMPT="%{$fg[red]%}% %M %{$reset_color%}% %{$fg[cyan]%}% %~ %{$reset_color%}%"
PROMPT=" %{$fg[cyan]%}% %~ %{$reset_color%}%"

#ASCII ART at startup
/home/valentin/Apps/space.sh
