#!/bin/bash

# Enforce user to run the script with sudo or root

if [[ "${UID}" -ne 0 ]]
then
    echo "Please run the script the with sudo or root."
    exit 1
fi

# Provide user the help if they do not give the username for the account creation

if [[ "${#}" -lt 1 ]]
then
    echo
    echo "Please provide at least one argument."
    echo
    echo "USAGES: ${0} USER_NAME"
    echo
    echo "e.g. ${0} akharat"
    echo
else
    # Capture the username and comment(full_name) from the command line
    # Use shift to capture the comment
    USER_NAME="${1}"
    shift
    COMMENT="${@}"

    # Generate the password for the new user account

    SPECIAL_CHAR=$(echo "!@#$%^&*()_+=-" | fold -w 1 | shuf | head -c 1)

    PASSWORD=$(date +%s%N | sha256sum | head -c 14)

    # Create the user

    useradd -c "${COMMENT}" -m "${USER_NAME}"

    # Set the password for the user

    echo "${PASSWORD}${SPECIAL_CHAR}" | passwd --stdin "${USER_NAME}"

    # Set password expiry

    passwd -e "${USER_NAME}"

    # Print everything to user

    echo
    echo "Your username: ${USER_NAME}"
    echo
    echo "Your password: ${PASSWORD}${SPECIAL_CHAR}"
    echo
    echo "The hostname: ${HOSTNAME}"
    echo
fi
