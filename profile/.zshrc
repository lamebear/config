[[ -f ~/.envs ]] && source ~/.envs

# Path to your oh-my-zsh installation.
export ZSH="/Users/jacoblambert/.oh-my-zsh"

ZSH_THEME="agnoster"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git)

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

prompt_context(){}