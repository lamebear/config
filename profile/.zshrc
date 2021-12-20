[[ -f ~/.envs ]] && source ~/.envs

# Path to your oh-my-zsh installation.
export ZSH="/Users/jlambert/.oh-my-zsh"

ZSH_THEME="agnoster"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git aws vscode)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.functions ]] && source ~/.functions

alias edit_profile="vi ~/.zshrc"
alias reload_profile=". ~/.zshrc"

if [ -f $(brew --prefix)/bin/virtualenvwrapper.sh ]
then
    . $(brew --prefix)/bin/virtualenvwrapper.sh
fi

export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
prompt_context(){}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
