#!/bin/bash

# Write a function which writes log to syslog when the VERBOSE is true.

log(){
      local MESSAGE=${@}
      if [[ "${VERBOSE}" = "true" ]]
      then	  
         echo "This is a log message: ${MESSAGE}"
      fi
      logger -t 13_functions.sh "${MESSAGE}"
}

# Create a function which will take a backup of the file and will return a non-zero exit code on error.

backup_file(){
	local FILE="${1}"
	#Make sure if the file exist
	if [[ -f "${FILE}" ]]
        then
	    local BACKUP_FILE="/var/tmp/$(basename ${FILE}).$(date +%F-%N)"
	    log "Backing up ${FILE} to ${BACKUP_FILE}"
	    cp -p "${FILE}" "${BACKUP_FILE}"
	else
	    return 1
	fi
}

readonly VERBOSE='true'

backup_file "/etc/passwd"


# Make decisions based on the status code of the functions

if [[ "${?}" -eq 0 ]]
then
    echo "Backup of the file succeeded"
else
    echo "Backup of the file failed"
    exit 1
fi
