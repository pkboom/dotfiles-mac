#!/bin/bash

result=$(conda config --show auto_activate_base)

if [ "$result" = "auto_activate_base: True" ]; then
  conda config --set auto_activate_base false
else
  conda config --set auto_activate_base true
fi
