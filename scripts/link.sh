#!/bin/bash

rm -rf "$HOME"/.zshrc
ln -s "$HOME"/.dotfiles/.zshrc "$HOME"

rm -rf "$HOME"/.my.cnf
ln -s "$HOME"/.dotfiles/.my.cnf "$HOME"

rm -rf "$HOME"/.gitconfig
ln -s "$HOME"/.dotfiles/.gitconfig "$HOME"

rm -rf "$HOME"/.gitignore_global
ln -s "$HOME"/.dotfiles/.gitignore_global "$HOME"

# Symlink the Mackup config file to the home directory
rm -rf "$HOME"/.gitignore_global
ln -s "$HOME"/.dotfiles/.mackup.cfg "$HOME"
