#!/bin/bash

export PS1="\W \$ "

PATH=$(env -i bash -c 'echo $PATH')
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f ~/.aliases ]  && . ~/.aliases
[ -f ~/.functions ] && . ~/.functions

alias edit_profile="vi ~/.bash_profile"
alias reload_profile=". ~/.bash_profile"
alias la="ls -al"

export PATH="/usr/sbin:/sbin:$PATH"
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

export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/node@12/bin:$PATH"
