#!/bin/bash

# This script creates an account on the local system
# You will be prompted for an account name and the password

# Ask for the username (username should always be 8 chars and not more than that)

read -p "Enter the username: " USER_NAME

# Ask for the user's full name

read -p "Enter your full name: " COMMENT

# Ask for the password

read -p "Enter the password of your choice: " PASSWORD

# Create the user

useradd -c "${COMMENT}" -m "${USER_NAME}"

# Set the password for the user

echo "${PASSWORD}" | passwd --stdin ${USER_NAME}

# Force the password change on the first login

passwd -e ${USER_NAME}

