#!/bin/bash

export PS1="\W \$ "

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f ~/.bash_aliases ]  && . ~/.bash_aliases
[ -f ~/.bash_functions ] && . ~/.bash_functions

export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/node@10/bin:$PATH"

export WORKON_HOME="~/Envs"

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

if [ -f $(brew --prefix)/bin/virtualenvwrapper.sh ]
then
    . $(brew --prefix)/bin/virtualenvwrapper.sh
fi