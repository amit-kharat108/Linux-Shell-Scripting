#!/bin/bash

# This script shows the open network ports on the system
# User -4 option to limit the output to v4 ports

netstat -nutl ${1} | grep ":" | awk '{print $4}' | cut -d ":" -f 2


