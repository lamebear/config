gitclean ()
{
        git fetch -p && git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' > /tmp/localDelete && vi /tmp/localDelete && xargs git branch -d < /tmp/localDelete
}