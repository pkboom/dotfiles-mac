#!/bin/bash

cd $HOME/code/acto3.0

docker-compose down

echo
echo 'acto3.0 stopped.'

echo
echo 'nginx & mysql starting'

sudo service nginx start 
sudo service mysql start 

