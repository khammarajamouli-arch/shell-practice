#!/bin/bash


START_TIME=$(date +%s)

sleep 10

END_TIME=$(date +%s)

echo "Time taken to execute the sleep command: $((END_TIME - START_TIME)) seconds"