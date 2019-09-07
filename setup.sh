#!/bin/bash
pushd $HOME

hash brew 2>/dev/null || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

packages=(git go kubernetes-cli)
casks=(google-cloud-sdk iterm2 spotify visual-studio-code)

for package in "${packages[@]}"
do
    brew list -1 | grep -w $package || brew install $package
done

for cask in "${casks[@]}"
do
    brew cask list -1 | grep -w $package || brew install $cask
done

if [ ! -f .ssh/id_rsa ]
then
    read -p "Username for SSH Key:" username

    ssh-keygen -t rsa -b 4096 -C $username
fi

if [ ! -d code/misc/comp-config ]
then
    cat .ssh/id_rsa.pub | pbcopy

    read -p "Press enter once the SSH Key has been added to github..."

    mkdir -p code/misc
    git clone git@github.com:lamebear/comp-config.git

    ./code/misc/comp-config/init.sh
fi

popd