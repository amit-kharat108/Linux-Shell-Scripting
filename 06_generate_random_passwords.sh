#!/bin/bash

# This script generates a list of random passwords

# A random number as a password

PASSWORD=${RANDOM}

echo "The one_random password: ${PASSWORD}"

# Three random numbers as a password

echo "The three_random password: ${PASSWORD}${PASSWORD}${PASSWORD}"


#Use current date/time as the basis for the password(use seconds and nano seconds)

PASSWORD=$(date +%s%N)

echo "The password using the date command: ${PASSWORD}"

# Create a better password with sha256sum and the date

PASSWORD=$(date +%s%N | sha256sum | head -c 14)

echo "The password with sha256sum: ${PASSWORD}"

# Create a better password with a special character

SPECIAL_CHAR=$(echo "!@#$%^&*()_+=-" | fold -w 1 | shuf | head -c 1)

PASSWORD=$(date +%s%N | sha256sum | head -c 14)

echo "The better password: ${PASSWORD}${SPECIAL_CHAR}"

