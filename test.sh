#!/bin/zsh

iniFileLocation=$(php --ini | grep '/php.ini' | cut -f2 -d: | sed 's/ //g')
# package=$(echo "$1" | cut -d/ -f2- | sed 's/\.git//')
echo $iniFileLocation

sudo sed -i -e 's/^zend_extension="xdebug.so"/zend_extension="xdebug.so"\nxdebug.mode=debug\nxdebug.start_with_request=yes/' "$iniFileLocation"
