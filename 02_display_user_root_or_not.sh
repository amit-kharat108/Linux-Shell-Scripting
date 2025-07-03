#!/bin/bash

# Display the UID and the username of the user executing this script
# Display if the user is root or not

# Display the UID

echo "Your UID is: ${UID}"

# Display the username

USER_NAME=$(id -un)

#Check if the user executing this script is root or not

if [[ "$UID" -eq 0 ]]
then
    echo "Your are root"
else
    echo "You are not root"
fi
