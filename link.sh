#!/bin/bash

rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

rm -rf $HOME/.mackup.cfg
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

rm -rf $HOME/.gitconfig
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

rm -rf $HOME/.gitignore_global
ln -s $HOME/.dotfiles/.gitignore_global $HOME/.gitignore_global
