#! /bin/bash

# Check for Homebrew and install if we don't have it
# test ! expr: True if expr is false
if test ! $(which brew) then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Ensure Homebrew is solid
brew doctor

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Make ZSH the default shell environment
chsh -s $(which zsh)

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install PHP extensions with PECL
# pecl install memcached imagick

# Install Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Install global Composer packages
/usr/local/bin/composer global require laravel/installer laravel/valet

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Install global NPM packages
npm install --global yarn

# Create a code directory
mkdir $HOME/code

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos

touch $HOME/.hushlogin

./link.sh

mackup backup --force

git config --global core.excludesfile $HOME/.gitignore_global