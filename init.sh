#!/bin/bash

dir="$( cd "$( dirname "$0" )" && pwd )"

ln -s $dir/profile/.bash_profile $HOME/.bash_profile
ln -s $dir/profile/.bash_aliases $HOME/.bash_aliases
ln -s $dir/profile/.bash_functions $HOME/.bash_functions

read -p "Git User Email:" userEmail

git config --global user.name "Jacob Lambert"
git config --global user.email $userEmail

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status