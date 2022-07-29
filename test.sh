#!/bin/sh

forward=$(curl -s http://localhost:4040/api/tunnels | jq '.tunnels[0].public_url' | sed 's/"//')

# forward="https://df1b-76-70-89-92.ngrok.io"

clearEstatePath=~/code/clearestate-app/api/.env

sed -i -e "s#WEBHOOK_URL=.*#WEBHOOK_URL=$forward#" $clearEstatePath
