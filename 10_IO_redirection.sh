#!/bin/bash

# This script demonstrates I/O redirection

# Redirect STDOUT to a file

FILE="/tmp/data"

head -n 1 /etc/passwd > "${FILE}"


# Redirect STDIN to a file

read LINE < "${FILE}"

echo "The LINE variable contains: ${LINE}"

# Redirect the STDOUT to a file, overwrite that file

echo
head -n 3 /etc/passwd > "${FILE}"

echo "Contents of the variable ${FILE}: "
echo
cat "${FILE}"
echo

# Redirect STDOUT to a file, append to that file

echo
head -n 1 /etc/passwd >> "${FILE}"
echo
echo "Contents of the variable ${FILE}"
echo
cat "${FILE}"
echo


# Redirect STDIN to a file, using FD 0

read LINE 0< "${FILE}"

echo "Contents of variable using FD0: ${LINE}"

# Redirect STDOUT to a file, using FD 1

head -n 1 /etc/passwd 1> "${FILE}"
echo
cat "${FILE}"
echo

# Redirect STDERR to a file, using FD 2

STDERR="/tmp/stderr.err"

echo
head -n 3 /etc/passwd /etc/hosts /fakefile 2> "${STDERR}"
echo
echo "Contents of stderr file: ${STDERR}"
echo
cat "${STDERR}"


# Redirect STDOUT and STDERR to a file
echo
echo
head -n 3 /etc/passwd /etc/hosts /fakefile &> "${STDERR}"
echo
echo "Contents of stdrr file: ${STDERR}"
echo
cat "${STDERR}"

# Redirect STDOUT and STDERR through a pipe

echo
head -n 3 /etc/passwd /etc/hosts /fakefile |& cat -n > "${STDERR}"
echo
echo "Contents of stderr file in: ${STDERR}"
echo
cat "${STDERR}"

# Discard STDOUT

echo
echo "Discarding the STDOUT"
head -n 3 /etc/passwd /fakefile > /dev/null
echo

# Discar STDIN

echo
echo "Discarding the STDERR"
head -n 3 /etc/passwd /fakefile 2> /dev/null
echo

# Discard both STDOUT and STDERR

echo
echo "Discarding the both STDOUT and STDERR"
head -n 3 /etc/passwd /fakefile &> /dev/null


