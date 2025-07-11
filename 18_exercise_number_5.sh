#!/bin/bash

# Count the number of failed logins by IP address.
# If there are any IP with over LIMIT failures, display the count, IP and the location

LIMIT="10"

LOG_FILE="${1}"

# Make sure file was supplied as an argument
if [[ ! -e "${LOG_FILE}" ]]
then
    echo "Cannot open log file: ${LOG_FILE}" >&2
    exit 1
fi

# Loop through the failed attempts and the correspondin IP address

grep "Failed" ${LOG_FILE} | awk '{print $(NF - 3)}' | sort | uniq -c | sort -nr | while read COUNT IP
do
  if [[ "$COUNT" -gt "${LIMIT}" ]]
  then
      LOCATION=$(geoiplookup ${IP})
      echo
      echo "COUNT: ${COUNT}"
      echo
      echo "IP_ADDRESS: ${IP}"
      echo
      echo "LOCATION: ${LOCATION}"
      echo
  fi
done

exit 0

