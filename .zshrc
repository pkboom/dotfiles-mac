# Load Composer tools
export PATH=$HOME/.composer/vendor/bin:$PATH

# Load Node global installed binaries
export PATH=$HOME/.node/bin:$PATH

# Load npm global path
export PATH=$HOME/.npm-packages/bin:$PATH

# Use project specific binaries before global ones
export PATH=node_modules/.bin:vendor/bin:$PATH

export DOTFILES=$HOME/.dotfiles

# postgres
# export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH

# pip
# export PATH=/Users/keunbae/Library/Python/2.7/bin:$PATH

# Path to your oh-my-zsh installation.o
export ZSH=$HOME/.oh-my-zsh

ZSH_CUSTOM=$DOTFILES/oh-my-zsh-custom

ZSH_THEME="robbyrussell2"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $DOTFILES/aliases.zsh
source $DOTFILES/functions.sh

export XDEBUG_CONFIG="idekey=VSCODE"

DIR=${PWD##*/}
if [ "code" = "$DIR" ]; then
    ls
fi

# remove % before each prompt on zsh
# unsetopt PROMPT_SP
