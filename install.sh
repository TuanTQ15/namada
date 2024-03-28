#!/bin/bash
sudo systemctl stop namadad.service
OPERATING_SYSTEM="Linux" # or "Darwin" for MacOS

# Specify the directory for download and extraction
directory="$HOME/install_namada"

# Create the directory if it doesn't exist
mkdir -p "$directory"

# Specify the new name for the downloaded file
new_filename="new_name.tar.gz"

# Get the URL of the latest release
latest_release_url=$(curl -s "https://api.github.com/repos/anoma/namada/releases/latest" | grep "browser_download_url" | cut -d '"' -f 4 | grep "$OPERATING_SYSTEM")

echo "Downloading file from $latest_release_url to $directory/$new_filename"

# Download the latest release to the specified directory and rename it
wget -O "$directory/$new_filename" "$latest_release_url"

# Extract the downloaded tar.gz file in the specified directory
tar -xzvf "$directory/$new_filename" -C "$directory"

# Find the directory that was extracted
extracted_directory=$(tar -tzf "$directory/$new_filename" | head -1 | cut -f1 -d"/")

# Move the extracted files to /usr/local/bin/
sudo cp "$directory/$extracted_directory"/* /usr/local/bin/
