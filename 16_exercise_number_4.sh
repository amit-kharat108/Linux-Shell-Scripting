#!/bin/bash

# This script disables, deletes and/or archives users home directory on the local system

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


# Parse the options



# Remove the options and keep the argument which user will provide



# If the user does not supply at least one argument then provide them the help


# Loop through the all the usernames supplied as an argument


  # Make sure the UID of the account is at least 1000
  

  # Create an archive if requested to do so
 
      # Make sure archive directory exist
      
 
      # Archive the user's home directory and move it to ARCHIVE_DIR

      # Delete the user

      # Check if the userdel command succeeded


      # Disable or expire the user account




exit 0
