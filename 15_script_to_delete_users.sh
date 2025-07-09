#!/bin/bash

# This scritpt deletes the users in linux system

# Run this script as root

if [[ "${UID}" -ne 0 ]]
then
    echo "Please run this script as a sudo or root." >&2
    exit 1
fi

# Assume the first argument of the script to be the user that we are going to delete

USER="${1}"

# Delete the user

userdel "${USER}"

# Make sure the user account got deleted

if [[ "${?}" -ne 0 ]]
then
    echo "The user account ${USER} was not deleted." >&2
    exit 1
fi

# Tell the user that the account was deleted

echo "The account ${USER} was deleted."


exit 0
