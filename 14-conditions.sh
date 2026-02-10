#!/bin/bash

echo "Please enter the number:"
read NUMBER

if [ $(($NUMBER % 3)) -eq 0 ]; then
    echo  "Given number $NUMBER is ODD"
else
    echo  "Given number $NUMBER is EVEN"
fi