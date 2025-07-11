#!/bin/bash

# This script disables, deletes and/or achives users home directory on the local system

# Define the usage function

usage(){
      echo
      echo "Usage: ${0} [-dra] USER_NAME...[USER_NAME]" >&2
      echo "              -d   deletes the user" >&2
      echo "              -r   removes the home directory of the user associated with it." >&2
      echo "              -a   archives the home directory of the user" >&2
      echo
      exit 1
}

# Define the archive directory

ARCHIVE_DIR="/archive"


# Make sure if this script is being executed with superuser previleges

if [[ "${UID}" -ne 0 ]]
then
    echo "Please run this script as sudo or as a root." >&2
    exit 1
fi

# Parse the options

while getopts dra OPTION
do
  case "${OPTION}" in
     d) DELETE_USER="true" ;;
     r) REMOVE_OPTION="-r" ;;
     a) ARCHIVE="true" ;;
     ?) usage ;;
  esac
done


# Remove the options and keep the argument which user will provide

shift "$(( OPTIND -1 ))"

# If the user does not supply at least one argument then provide them the help

if [[ "${#}" -lt 1 ]]
then
    usage
fi

# Loop through the all the usernames supplied as an argument

for USER_NAME in "${@}"
do
  echo "Processing user: ${USER_NAME}"

  # Make sure the UID of the account is at least 1000
  
  USER_ID=$(id -u "${USER_NAME}")
  if [[ "${USER_ID}" -lt 1000 ]]
  then
      echo "System user cannot be deleted with the USER ID: ${USER_ID}" >&2
      exit 1
  fi

  # Create an archive if requested to do so
  
  if [[ "${ARCHIVE}" = 'true' ]]
  then
      # Make sure archive directory exist
      
      if [[ ! -d "${ARCHIVE_DIR}" ]]
      then
	  echo "Creating ${ARCHIVE_DIR} directory..."
	  mkdir -p "${ARCHIVE_DIR}"
	  if [[ "${?}" -ne 0 ]]
          then
	      echo "The archive directory ${ARCHIVE_DIR} could not be created" >&2
	      exit 1
	  fi
      fi


      # Archive the user's home directory and move it to ARCHIVE_DIR

      HOME_DIR="/home/${USER_NAME}"
      ARCHIVE_FILE="${ARCHIVE_DIR}/${USER_NAME}.tgz"
      if [[ -d "${HOME_DIR}" ]]
      then
	  echo "Archiving the ${HOME_DIE} to ${ARCHIVE_FILE}"
	  tar -zcf "${ARCHIVE_FILE}" "${HOME_DIR}" &> /dev/null
	  if [[ "${?}" -ne 0 ]]
          then
              echo "Could not create archive file ${ARCHIVE_FILE}" >&2
	      exit 1
	  fi
      else
	  echo "${HOME_DIR} does not exist or is not a directory."
	  exit 1
      fi
  fi

  if [[ "${DELETE_USER}" = "true" ]]
  then
      # Delete the user
      userdel ${REMOVE_OPTION} ${USER_NAME}

      # Check if the userdel command succeeded

      if [[ "${?}" -ne 0 ]]
      then
	  echo "User account was not deleted" >&2
	  exit 1
      fi
      echo "Ther user ${USER_NAME} was deleted"

  else
      # Disable or expire the user account
      chage -E 0 "${USER_NAME}"
      if [[ "${?}" -ne 0 ]]
      then
          echo "The user account was not disabled" >&2
	  exit 1
      fi
      echo "The user name ${USER_NAME} was disabled"

  fi

done

exit 0
