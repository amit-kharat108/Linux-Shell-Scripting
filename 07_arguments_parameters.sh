#!/bin/bash

# This script generates a random password for each user specified on the command line

# Display what the user type on the command line

echo "You executed: ${0}"

# Display the path and the filename of the script

echo "You used $(dirname ${0}) and the file $(basename ${0})"

# Tell how many arguments they passed while executing the script
# Inside the script they are parameters, outside of the script they are arguments

NUMBER_OF_PARAMETERS="${#}"

echo "You supplied ${NUMBER_OF_PARAMETERS} arguments"

# Make sure they supply at least 1 argument

if [[ "${NUMBER_OF_PARAMETERS}" -lt 1 ]]
then
    echo "USAGE: ${0} USER_NAME USER_NAME..."
fi


# Generate and display a password for each parameter (user)

for USER_NAME in "${@}"
do
  PASSWORD=$(date +%s%N | sha256sum | head -c 14)  
  SPECIAL_CHAR=$(echo "!@#$%^&*()_+=-" | fold -w 1 | shuf | head -c 1)
  echo "${USER_NAME}: ${PASSWORD}${SPECIAL_CHAR}"
done


