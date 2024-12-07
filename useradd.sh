#!/bin/bash

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root" >&2
  exit 1
fi

# Variables
USERNAME="$1"
PASSWORD="$2"

# Check if username and password are provided
if [ -z "$USERNAME" ] || [ -z "$PASSWORD" ]; then
  echo "Usage: $0 <username> <password>" >&2
  exit 1
fi

# Add user
useradd -m "$USERNAME"
if [ $? -ne 0 ]; then
  echo "Failed to add user $USERNAME" >&2
  exit 1
fi

# Set password
echo "$USERNAME:$PASSWORD" | chpasswd
if [ $? -ne 0 ]; then
  echo "Failed to set password for user $USERNAME" >&2
  exit 1
fi

echo "User $USERNAME added successfully with the specified password."

exit 0

# Check the hostname
HOSTNAME=$(hostname)
echo "Hostname: $HOSTNAME"

# Check the current date and time
CURRENT_DATE=$(date)
echo "Current Date and Time: $CURRENT_DATE"

