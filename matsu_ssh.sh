#!/bin/sh

echo "Generating a new SSH key for Matsu..."

# Generating a new SSH key
ssh-keygen -t rsa -b 4096 -C "ppotpo@gmail.com"

echo "\nHost matsu\n HostName matsusushionhunter.com\n User pkboom\n IdentityFile ~/.ssh/id_rsa\n IdentitiesOnly yes" >> ~/.ssh/config

ssh-add

echo
echo log into server using digitalocean console
echo https://docs.google.com/document/d/1zs3pMTVsA5qbzdaf6W5alI7TAANMF0F1bxA_rCzbJgI/edit

