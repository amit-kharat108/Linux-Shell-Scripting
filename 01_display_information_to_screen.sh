# This script displays various information to the screen

# Display "Hello" to the screen

echo "Hello"

# Assigning a value to variable WORD="script"

WORD='script'

# Display the value using that variable

echo "$WORD"

# Demonstrate the single quotes does not print the variables

echo '$WORD'

# Combine a variable with hard coded text

echo "This is a shell $WORD"

# Display the contents of the variable using different syntax

echo "This is a ${WORD}"

# Append a text to variable

echo "${WORD}ing is fun"

# Show how not to append a text to a variable
# This is not how you append the text:

echo "$WORDing is fun"

# Create the a variable ENDING='ed'

ENDING="ed"

# Combine two variables

echo "This is ${WORD}${ENDING}"

# Change the value of ENDING variable

ENDING="ing"

# Combine the variables again

echo "${WORD}${ENDING} is fun."

# Re-assign the value of ENDING value

ENDING="s"

# Combing the variable again

echo "You are going to write many ${WORD}${ENDING}"
