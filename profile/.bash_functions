gpu ()
{
	git push --set-upstream origin $(git branch | grep '*' | awk '{ print $2 }')
}

gwm ()
{
	git co master && git pull && gitclean
}

payments-tunnel()
{
    env=$1
    type=$2

    k8s='192.168.67.2'
    prodDB='10.145.0.4'
    devDB='10.108.0.4'

    if [ $env = 'dev' ]; then
        echo "Opening tunnel to dev bastion..."
        if [ $type = 'k8s' ]; then
            gcloud compute ssh jacob@dev-bastion --zone=us-central1-a --ssh-flag="-nNT -L 9443:$k8s:443 -p 7865"
        elif [ $type = 'db' ]; then
            gcloud compute ssh jacob@dev-bastion --zone=us-central1-a --ssh-flag="-nNT -L 65432:$devDB:5432 -p 7865"
        fi
    elif [ $env = 'prod' ]; then
        echo "Opening tunnel to prod bastion..."
        if [ $type = 'k8s' ]; then
            gcloud compute ssh jacob@prod-bastion --zone=us-central1-a --internal-ip --ssh-flag="-nNT -L 9443:$k8s:443"
        elif [ $type = 'db' ]; then
            gcloud compute ssh jacob@prod-bastion --zone=us-central1-a --internal-ip --ssh-flag="-nNT -L 65432:$prodDB:5432"
        fi
    elif [ $env = 'cicd' ]; then
        echo "Opening tunnel to cicd bastion..."
        gcloud compute ssh jacob@cicd-bastion --zone=us-central1-a --ssh-flag="-nNT -L 9443:$k8s:443 -p 7865"
    fi
}

b64(){
    printf "%s" "$1" | base64
}

b64d(){
    printf "%s" "$1" | base64 -D && echo
}
