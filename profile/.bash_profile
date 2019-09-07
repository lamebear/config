#!/bin/bash

export PS1="\W \$ "

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f ~/.bash_aliases ]  && . ~/.bash_aliases
[ -f ~/.bash_functions ] && . ~/.bash_functions

export PATH="/usr/local/opt/python/libexec/bin:$PATH"

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'
