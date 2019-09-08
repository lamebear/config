#!/bin/bash
pushd $HOME

hash brew 2>/dev/null || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

taps=("homebrew/cask-versions")
packages=(git go kubernetes-cli node@10 python redis vault)
casks=(docker firefox-developer-edition google-cloud-sdk google-chrome iterm2 slack spotify visual-studio-code)

for tap in "${taps[@]}"
do
    brew tap | grep -w $tap || brew tap $tap
done

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

source .bash_profile

popd