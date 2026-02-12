#!/bin/bash

set -e 

error(){
      echo "there is an error"
}

trap error ERR

echo "hi hello"
echo  "this is before error"
errrrr
echo "after the error"