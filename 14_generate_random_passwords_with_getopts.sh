#!/bin/bash

# This script generates a random password
# This user can set the password length with -l option and can add a special character with -s
# Verbose mode can be enabled with -v

# Define the usage function

usage(){
	echo
	echo "Usage: ${0} [-vs] [-l LENGTH]" >&2
	echo
	echo "Generate a random password"
	echo
	echo "-l LENGTH   Specify the password length"
	echo
	echo "-s          Specify if you want a special character in your password"
	echo
	echo "-v          Set verbosity"
	echo
	exit 1
}

# Define the log function for verbosity

log(){
      local MESSAGE="${@}"
      if [[ "${VERBOSE}" = "true" ]]
      then
	  echo "${MESSAGE}"
      fi
}

# Set the default password length

LENGTH=48


# getopts with a while loop

while getopts vl:s OPTION
do
  case "${OPTION}" in
     v)
       VERBOSE='true'
       echo
       log "Verbose mode is on"
       ;;
     l)
       LENGTH="${OPTARG}"
       ;;
     s)
       USE_SPECIAL_CHAR='true'
       ;;
     ?)
       usage
       ;;
  esac
done
       
# Generate the password with special char if user asks for it
log "Generating the password"

PASSWORD=$(date +%s%N | sha256sum | head -c "${LENGTH}")

if [[ "${USE_SPECIAL_CHAR}" = "true" ]]
then
    log "Setting a random special character."
    SPECIAL_CHAR=$(echo "!@#$%^&*()_+=-" | fold -w 1 | shuf | head -c 1)
    PASSWORD="${PASSWORD}${SPECIAL_CHAR}"
fi

log "Done"

#Display the password
echo "Your password: ${PASSWORD}"
exit 0
