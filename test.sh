#!/bin/zsh

conda_line="#return 0 #anaconda"
currentLine=$(grep $conda_line /Users/keunbae/.dotfiles/.zshrc)

echo $currentLine

if [ -z "$currentLine" ]; then
  sed -i "" -e 's/^return 0 #anaconda/#return 0 #anaconda/g' /Users/keunbae/.dotfiles/.zshrc

  echo "yes anaconda"
else
  sed -i "" -e 's/^#return 0 #anaconda/return 0 #anaconda/g' /Users/keunbae/.dotfiles/.zshrc

  echo "no anaconda"
fi
