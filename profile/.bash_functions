#!/bin/bash

gpu ()
{
	git push --set-upstream origin $(git branch | grep '*' | awk '{ print $2 }')
}

gwm ()
{
	git co master && git pull
}

b64(){
    printf "%s" "$1" | base64
}

b64d(){
    printf "%s" "$1" | base64 -D && echo
}
