#!/bin/bash

code $HOME/code/acto3.0/application

sudo service nginx stop
sudo service mysql stop

echo 'nginx and mysql stopped.'
echo

cd $HOME/code/acto3.0

sudo sysctl -w vm.max_map_count=262144
docker-compose up -d
docker volume prune -f
