#!/bin/bash

# Extract the list of providers
providers=$(terraform providers | awk -F'[][]' '/\] [0-9]+\.[0-9]+\.[0-9]+$/{split($2, a, "/"); print a[2]"/"a[3]}')

# Update each provider
echo "$providers" | while read -r provider; do
  echo "Updating provider: $provider"
  tfupdate provider -r "$provider" .
done