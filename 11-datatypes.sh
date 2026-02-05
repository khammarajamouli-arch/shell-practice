#!/bin/bash


LEADERS=("Alice" "Bob" "Charlie" "Diana")

echo "Leaders in the team are: ${LEADERS[@]}"
echo "First leader is: ${LEADERS[0]}"
echo "Second leader is: ${LEADERS[1]}"
echo "Third leader is: ${LEADERS[2]}"
echo "Fourth leader is: ${LEADERS[3]}"
echo "Total number of leaders: ${#LEADERS[@]}"