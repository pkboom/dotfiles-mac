#!/bin/bash

# trim spaces
url=$(echo {query} | tr -s '[:blank:]')

# remove `git clone`
url=${url/git clone /}

cd ~/code

git clone $url

if [ $? = 0 ]; then
  # url starts with either `https://` or `git@`
  repo=$(echo $url | rev | cut -d/ -f1 | sed "s/tig\.//" | rev)

  code $repo

  exit
fi
