#!/bin/bash

echo "All the special variables in this script are: $*"
echo "All the special variables in this script are: $@"
echo "The name of the script is: $0"
echo "Current working directory is: $PWD"
echo "Who executed the script: $USER"
echo "Home directory of the user: $HOME"
echo "The process ID of the current script is: $$"
sleep 10 &
echo "The process ID of the last background command is: $!"

