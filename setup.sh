#!/bin/bash

function setup_osx()
{
    [[ -z $(which pip) ]] && (
        echo "Installing pip..."
        read -p "waiting"
        curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
        python get-pip.py --user
        rm get-pip.py
    ) || echo "pip already installed..."

    [[ -z $(which ansible) ]] && (
        echo "Installing ansible..."
        read -p "waiting"
        python -m pip install --user ansible
    ) || echo "ansible already installed..."
}

case "$OSTYPE" in
  darwin*)
    setup_osx
  linux*)
    echo "LINUX" ;;
  *)
    echo "unknown: $OSTYPE" ;;
esac

read -p "Initial Github PAT: " token
TOKEN=$token ansible-pull -U https://$TOKEN:x-oauth-basic@github.com/lamebear/comp-config -d /opt/lamebear/comp-config

# hash brew 2>/dev/null || (echo "Installing Homebrew...." && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)")

# # Install Ansible

# # Run an ansible-pull

# packages=(awscli git go kubernetes-cli node@14 postgresql python redis terraform vault vim yarn)
# casks=(discord docker google-cloud-sdk iterm2 keybase postman slack spotify virtualbox virtualbox-extension-pack visual-studio-code)
# npmPackages=("@vue/cli", "@vue/cli-init", "aws-cdk")
# pipPackages=(virtualenv virtualenvwrapper)
# vscodeExtensions=(davidanson.vscode-markdownlint eamodio.gitlens mauve.terraform ms-azuretools.vscode-docker ms-vscode.Go octref.vetur wakatime.vscode-wakatime)


# echo "Setting up Homebrew Packages..."
# brew install ${packages[@]}

# echo "Setting up Homebrew Casks..."
# brew install ${casks[@]}

# echo "Setting git configurations..."
# git config --global user.name > /dev/null || git config --global user.name "Jacob Lambert"
# git config --global user.email > /dev/null || (read -p "Git User Email: " userEmail && git config --global user.email $userEmail)

# git config --global alias.co checkout
# git config --global alias.br branch
# git config --global alias.ci commit``
# git config --global alias.st status

# [ -f .ssh/id_rsa ] || (read -p "Username for SSH Key:" sshUsername && ssh-keygen -t rsa -b 4096 -C $sshUsername)

# if [ ! -d code/misc/comp-config ]
# then
#     cat .ssh/id_rsa.pub | pbcopy

#     read -p "Press enter once the SSH Key has been added to github..."

#     mkdir -p code/misc
#     git clone git@github.com:lamebear/comp-config.git code/misc

#     pushd code/misc/comp-config > /dev/null
#     git submodule update --init
#     popd > /dev/null
# fi


# echo "Setting up Vim..."
# [[ -L .vimrc && -f .vimrc ]] || ln -s $(pwd)/code/misc/comp-config/vim/.vimrc $(pwd)/.vimrc
# [ -d .vim ] || mkdir $(pwd)/.vim
# [[ -L .vim/bundle && -d .vim/bundle ]] || ln -s $(pwd)/code/misc/comp-config/vim/bundle $(pwd)/.vim/bundle

# echo "Installing Oh My Zsh..."
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# echo "Setting up dotfiles..."
# [[ -L .aliases && -f .aliases ]] || ln -s $(pwd)/code/misc/comp-config/profile/.aliases .aliases
# [[ -L .functions && -f .functions ]] || ln -s $(pwd)/code/misc/comp-config/profile/.functions .functions
# [[ -L .zshrc && -f .zshrc ]] || (ln -s $(pwd)/code/misc/comp-config/profile/.zshrc .zshrc && source .zshrc)

# echo "Installing global NPM Packages..."
# for pkg in ${npmPackages[@]}
# do
#     npm list --depth 0 -g $pkg > /dev/null 2>&1 || npm install -g $pkg
# done

# echo "Installing pip Packages..."
# for pkg in ${pipPackages[@]}
# do
#     pip list | grep -iq $pkg || pip install $pkg
# done

# echo "Setting up virtualenv..."
# . $(brew --prefix)/bin/virtualenvwrapper.sh

# echo "Installing vscode extensions..."
# [[ -L /usr/local/bin/code && -f /usr/local/bin/code ]] || ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code /usr/local/bin/code
# for ext in ${vscodeExtensions[@]}
# do
#     code --list-extensions | tail -n +1 | grep -iwq $ext || code --install-extension $ext
# done

# pushd $(brew --prefix)/etc/bash_completion.d > /dev/null

# [ -L docker.bash-completion ] || ln -s /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
# [ -L docker-machine.bash-completion ] || ln -s /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion
# [ -L docker-compose.bash-completion ] || ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion

# popd > /dev/null

# popd > /dev/null
