#!/bin/bash

export PS1="\W \$ "

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f ~/.bash_aliases ]  && . ~/.bash_aliases
[ -f ~/.bash_functions ] && . ~/.bash_functions

export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/node@12/bin:$PATH"
export PATH="$HOME/code/misc/comp-config/bin:$PATH"

if [ -d "$HOME/go" ]; then
    export PATH="$HOME/go/bin:$PATH"
fi

if [ -f "$HOME/.local_bash_profile" ]; then
    . "$HOME/.local_bash_profile"
fi

export WORKON_HOME="~/Envs"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export ANDROID_HOME='/usr/local/share/android-sdk'

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

if [ -f $(brew --prefix)/bin/virtualenvwrapper.sh ]
then
    . $(brew --prefix)/bin/virtualenvwrapper.sh
fi