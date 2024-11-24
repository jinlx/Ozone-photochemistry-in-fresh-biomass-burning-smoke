#!/bin/bash

# Navigate to the repository root directory
cd "$(dirname "$0")"

# Find files larger than 100MB and append them to .gitignore
find . -type f -size +100M | while read file; do
    echo "$file" >> .gitignore
done

# Remove duplicate lines in .gitignore
awk '!seen[$0]++' .gitignore > temp && mv temp .gitignore
