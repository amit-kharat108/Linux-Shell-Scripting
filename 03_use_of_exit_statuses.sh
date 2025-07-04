#!/bin/bash

# Display the UID and the username of the user executing the script
# Display the user is akharat or not

# Display the UID

echo "Your UID is: ${UID}"

# Only Display the UID if this matches to 1000

if [[ "${UID}" -eq 1000 ]]
then
    echo "Your UID is: ${UID}"
fi

# Display the username

USER_NAME=$(id -un)

# Test if the command succeeded

if [[ "${?}" -ne 0 ]]
then
    echo "Your command was successfully executed."
else
    echo "Your command was not successful"
fi

# You can use a string test conditional

USER_TO_TEST='akharat'

if [[ "${USER_TO_TEST}" == "${USER_NAME}" ]]
then
    echo "You are user: ${USER_NAME}"
fi


# Test for !=(not equal) for the string

if [[ "${USER_TO_TEST}" != "${USER_NAME}" ]]
then
    echo "You are not the user: ${USER_NAME}"
else
    echo "You are not akharat user"
fi
