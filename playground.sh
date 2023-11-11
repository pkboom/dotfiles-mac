#!/bin/bash

aws_line="inbox_monster_prod"

sed -i "" -e "s/^export AWS_PROFILE.*/export AWS_PROFILE=$aws_line/" /Users/keunbae/.dotfiles/.zshrc
