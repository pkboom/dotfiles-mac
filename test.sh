#!/bin/sh

echo "git@github.com:jessarcher/zsh-artisan.git" | cut -d/ -f2 | sed "s/.git//"
