#!/bin/bash

rm -rf "$HOME"/.gitconfig
ln -s "$HOME"/.dotfiles/.gitconfig "$HOME"

rm -rf "$HOME"/.gitignore_global
ln -s "$HOME"/.dotfiles/.gitignore_global "$HOME"

# Symlink the Mackup config file to the home directory
rm -rf "$HOME"/.mackup.cfg
ln -s "$HOME"/.dotfiles/.mackup.cfg "$HOME"
