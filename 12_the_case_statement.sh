#!/bin/bash

# This script demonstrate the case statement
# Make use of case "variable" in to handle the if-elif in a better way



#if [[ "${1}" = "start" ]]
#then
#    echo "Starting..."
#elif [[ "${1}" = "stop" ]]
#then
#    echo "Stopping..."
#elif [[ "${1}" = "status" ]]
#then
#    echo "Status: "
#else
#    echo "Supply a valid option" >&2
#    exit 1
#fi

##  Method 1 of using the case statement

#case "${1}" in
#   start)
#        echo "Starting..."
#	;;
#   stop)
#        echo "Stopping.."
#	;;
#   status|state|--status|--state)
#        echo "Status: Stopped"
#	;;
#   *)
#        echo "Please provide the valid input..." >&2
#	exit 1
#esac



# The below chunk of the code works as well

case "${1}" in
   start) echo "Starting..." ;;
   stop)  echo "Stopping..." ;;
   status|state|--state| --status) echo "Status: Stopped." ;;
   *)
          echo "Please provide the valid input..." >&2
	  exit 1
esac
