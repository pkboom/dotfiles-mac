#!/bin/zsh

iniFileLocation=$(php --ini | grep '/php.ini' | cut -f2 -d: | sed 's/ //g')
# package=$(echo "$1" | cut -d/ -f2- | sed 's/\.git//')
echo $iniFileLocation

currentLine=$(grep xdebug.so "$iniFileLocation")

echo $currentLine
