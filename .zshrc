# Load Composer tools
export PATH=$HOME/.composer/vendor/bin:$PATH

# Load Node global installed binaries
export PATH=$HOME/.node/bin:$PATH

# Use project specific binaries before global ones
export PATH=node_modules/.bin:vendor/bin:$PATH

export DOTFILES=$HOME/.dotfiles

# dotfiles
export PATH=$DOTFILES/scripts:$PATH 

# postgres
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH

source $HOME/.dotfiles/aliases.zsh

# Path to your oh-my-zsh installation.o
export ZSH=$HOME/.oh-my-zsh

source $ZSH/oh-my-zsh.sh

source $HOME/.dotfiles/robbyrussell2.zsh-theme

export XDEBUG_CONFIG="idekey=VSCODE"
