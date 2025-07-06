#!/bin/bash

# Demonstrate the use of shift and while loops

# Display the first 3 parameters which user will provide

echo
echo "first_parameter: ${1}"
echo "second_parameter: ${2}"
echo "third_parameter: ${3}"
echo

# Loop through all the positional parameters(utilizing shift) 

while [[ "${#}" -gt 0 ]]
do
  echo "Parameter 1: ${1}"
  echo "Parameter 2: ${2}"
  echo "Parameter 3: ${3}"
  shift
done
