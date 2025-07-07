#!/bin/bash

#Make sure the scripts is being executed as the root user or not.

if [[ "${UID}" -ne 0 ]]
then
    echo "Please run this script as either sudo or root" >&2
    exit 1
fi

#Make sure user provides at least one argument

if [[ "${#}" -lt 1 ]]
then
    echo "Please provide the username" 1>&2
    echo
    echo "USAGES: ${0} USER_NAME" 1>&2
    echo
    echo "e.g.- ${0} akharat Amit Kharat" 1>&2
    exit 1
fi

#The first parameter is the username

USER_NAME="${1}"

#Rest of the parameters are the comments

shift

COMMENT="${@}"

#Generate the password

SPECIAL_CHAR=$(echo "!@#$%^&*()_+=-" | fold -w 1 | shuf | head -c 1)

PASSWORD=$(date +%s%N | sha256sum | head -c 14)

#Create the user account with password also don't show this output to the user

useradd -c "${COMMENT}" -m "${USER_NAME}" &> /dev/null

#Check to see if the user account command succeded

if [[ "${?}" -ne 0 ]]
then
    echo "User account could not be created. Please try again." 1>&2
    exit 1
fi

#Set the password

echo "${PASSWORD}${SPECIAL_CHAR}" | passwd --stdin "${USER_NAME}" &> /dev/null

#Check to see if the passwd command succeded

if [[ "${?}" -ne 0 ]]
then
    echo "The password could not be set." 1>&2
    exit 1
fi

#Force the password change on the first login

passwd -e "${USER_NAME}" &> /dev/null

#Print all the information to the user

echo "Your username: ${USER_NAME}"
echo
echo "Your password: ${PASSWORD}${SPECIAL_CHAR}"
echo
echo "Your hostname: ${HOSTNAME}"
exit 0


