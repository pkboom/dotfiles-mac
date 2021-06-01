#!/bin/sh

echo "Generating a new SSH key for GitHub..."

touch ./config
echo "Host github.com\n HostName github.com\n User git\n IdentityFile ~/.ssh/id_ed25519" | tee ./config

# Adding your SSH key to your GitHub account
# https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account
echo "run 'pbcopy < ~/.ssh/id_ed25519.pub' and paste that into GitHub"
