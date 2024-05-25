#!/bin/bash

# Extract the list of providers
providers=$(terraform providers | grep -E '\] [0-9]+\.[0-9]+\.[0-9]+$' | awk -F'[][]' '{split($2, a, "/"); print a[2]"/"a[3]}')

# Iterate over the list and perform the command
echo "$providers" | while read -r provider; do
  echo "Updating provider: $provider"
  tfupdate provider -r "$provider" .
done
