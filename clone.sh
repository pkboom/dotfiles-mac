#!/bin/sh

echo "Cloning repositories..."

CODE=$HOME/code

git clone git@github.com:pkboom/matsu.git $CODE
git clone git@github.com:pkboom/experiment.git $CODE
git clone git@github.com:laravel/framework.git $CODE
