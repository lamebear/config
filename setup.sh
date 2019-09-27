#!/bin/bash

pushd $HOME > /dev/null

hash brew 2>/dev/null || (echo "Installing Homebrew...." && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)")

taps=("homebrew/cask-versions")
packages=(bash-completion git go k3d kubernetes-cli node@10 postgresql python redis vault)
casks=(docker firefox-developer-edition google-cloud-sdk iterm2 slack spotify visual-studio-code)
npmPackages=("@vue/cli")
pipPackages=(virtualenv virtualenvwrapper)
vscodeExtensions=(davidanson.vscode-markdownlint eamodio.gitlens mauve.terraform ms-azuretools.vscode-docker ms-vscode.Go octref.vetur)

echo "Setting up Homebrew Taps..."
for tap in "${taps[@]}"
do
    brew tap | grep -q -w $tap || brew tap $tap
done

echo "Setting up Homebrew Packages..."
brew install ${packages[@]} 2>/dev/null

echo "Setting up Homebrew Casks..."
brew cask install ${casks[@]} 2>/dev/null

echo "Setting git configurations..."
git config --global user.name > /dev/null || git config --global user.name "Jacob Lambert"
git config --global user.email > /dev/null || (read -p "Git User Email: " userEmail && git config --global user.email $userEmail)

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

[ -f .ssh/id_rsa ] || (read -p "Username for SSH Key:" sshUsername && ssh-keygen -t rsa -b 4096 -C $sshUsername)

if [ ! -d code/misc/comp-config ]
then
    cat .ssh/id_rsa.pub | pbcopy

    read -p "Press enter once the SSH Key has been added to github..."

    mkdir -p code/misc
    git clone git@github.com:lamebear/comp-config.git code/misc

    pushd code/misc/comp-config > /dev/null
    git submodule update --init
    popd > /dev/null
fi

[[ -L .vimrc && -f .vimrc ]] || ln -s $(pwd)/code/misc/comp-config/vim/.vimrc $(pwd)/.vimrc
[ -d .vim ] || mkdir $(pwd)/.vim
[[ -L .vim/bundle && -d .vim/bundle ]] || ln -s $(pwd)/code/misc/comp-config/vim/bundle $(pwd)/.vim/bundle

[[ -L .bash_aliases && -f .bash_aliases ]] || ln -s $(pwd)/code/misc/comp-config/profile/.bash_aliases .bash_aliases
[[ -L .bash_functions && -f .bash_functions ]] || ln -s $(pwd)/code/misc/comp-config/profile/.bash_functions .bash_functions
[[ -L .bash_profile && -f .bash_profile ]] || ln -s $(pwd)/code/misc/comp-config/profile/.bash_profile .bash_profile && source .bash_profile

echo "Installing global NPM Packages..."
for pkg in ${npmPackages[@]}
do
    npm list --depth 0 -g $pkg > /dev/null 2>&1 || npm install -g $pkg
done

echo "Installing pip Packages..."
for pkg in ${pipPackages[@]}
do
    pip list | grep -iq $pkg || pip install $pkg
done

echo "Installing vscode extensions..."
[[ -L /usr/local/bin/code && -f /usr/local/bin/code ]] || ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code /usr/local/bin/code
for ext in ${vscodeExtensions[@]}
do
    code --list-extensions | tail -n +1 | grep -iwq $ext || code --install-extension $ext
done

pushd $(brew --prefix)/etc/bash_completion.d > /dev/null

[ -L docker.bash-completion ] || ln -s /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
[ -L docker-machine.bash-completion ] || ln -s /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion
[ -L docker-compose.bash-completion ] || ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion

popd > /dev/null

popd > /dev/null