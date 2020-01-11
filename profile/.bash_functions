#!/bin/bash

gpu ()
{
	git push --set-upstream origin $(git branch --show-current)
}

gwm ()
{
	git co master && git pull && gitclean
}

b64(){
    printf "%s" "$1" | base64
}

b64d(){
    printf "%s" "$1" | base64 -D && echo
}

gitclean ()
{
    git fetch -p && git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' > /tmp/localDelete && vi /tmp/localDelete && xargs git branch -d < /tmp/localDelete
}
