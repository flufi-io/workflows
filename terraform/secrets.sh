#!/bin/bash

# Define environments
environments=("sandbox" "development" "staging" "production")

# Check for arguments
if [ "$#" -eq 1 ]; then
    operation=$1
    selected_environments=("${environments[@]}")
elif [ "$#" -eq 2 ]; then
    operation=$1
    selected_environments=("$2")
else
    echo "Usage: $0 [-e|-d] [optional: sandbox|development|staging|production]"
    exit 1
fi

# Function to perform sops operation
perform_sops_operation() {
    local environment=$1
    local file_type=$2
    local file_suffix=".tfvars.json"
    local encrypted_suffix=".tfvars.enc.json"

    if [ "$file_type" == "fixtures" ]; then
        decrypted_file="${file_type}.${environment}${file_suffix}"
    else
        decrypted_file="${file_type}.${environment}.auto${file_suffix}"
    fi

    encrypted_file="${decrypted_file/.tfvars.json/$encrypted_suffix}"

    # Adjusted check for secrets file existence
    if [ "$file_type" == "secrets" ]; then
        if [ "$operation" == "-e" ] && [ ! -f "$decrypted_file" ]; then
            echo "Decrypted secrets file ($decrypted_file) not found for encryption. Skipping."
            return
        elif [ "$operation" == "-d" ] && [ ! -f "$encrypted_file" ]; then
            echo "Encrypted secrets file ($encrypted_file) not found for decryption. Skipping."
            return
        fi
    elif [ "$file_type" == "fixtures" ] && [ ! -f "$decrypted_file" ] && [ "$operation" == "-e" ]; then
        echo "No suitable fixtures file found for encryption in $environment. Skipping."
        return
    fi

    # Perform sops operation and check if successful
    if [ "$operation" == "-e" ]; then
        if [ -f "$encrypted_file" ]; then
            echo "Encrypted file ($encrypted_file) already exists. Skipping encryption."
            return
        fi
        if sops -e "$decrypted_file" > "$encrypted_file"; then
            echo "Encryption of $decrypted_file successful."
            rm -f "$decrypted_file"
            git add "$encrypted_file"
            echo "Original file ($decrypted_file) deleted."
        else
            echo "Encryption of $decrypted_file failed."
            rm -f "$encrypted_file"
            return 1
        fi
    elif [ "$operation" == "-d" ]; then
        if [ -f "$decrypted_file" ]; then
            echo "Decrypted file ($decrypted_file) already exists. Skipping decryption."
            return
        fi
        if sops --ignore-mac -d "$encrypted_file" > "$decrypted_file"; then
            echo "Decryption of $encrypted_file successful."
            rm -f "$encrypted_file"
            git rm --cached *.enc.json
            echo "Encrypted file ($encrypted_file) deleted."
        else
            echo "Decryption of $encrypted_file failed."
            rm -f "$decrypted_file"
            return 1
        fi
    else
        echo "Invalid operation: $operation"
        exit 1
    fi
}

# Loop over selected environments and file types
for env in "${selected_environments[@]}"; do
    perform_sops_operation "$env" "fixtures" # Fixtures files pattern corrected
    perform_sops_operation "$env" "secrets"  # Only attempt if secrets file exists
done
