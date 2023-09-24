#!/bin/bash

# database quering variable
PSQL="psql -U freecodecamp -d number_guessing_game -t -A -c"

# Secret number generator
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

echo -e "\n~~~~~ Number Guessing Game ~~~~~\n"

echo "Enter your username:"
read USERNAME

if [[ -z $USERNAME ]]
then
    echo -e "\nPlease enter your username"
    read USERNAME
fi

# check if user is available or not if and get the gameplayed and minimum number of guesses value
USER_AVAIL=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")
GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games INNER JOIN users USING(user_id) WHERE username='$USERNAME'")
BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games INNER JOIN users USING(user_id) WHERE username='$USERNAME'")

# if user not found
if [[ -z $USER_AVAIL ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
else
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# start the guessing game
echo -e "\nGuess the secret number between 1 and 1000:"
read INPUT_NUMBER
NUMBER_OF_GUESSES=1

# validate the input as number type
until [[ $INPUT_NUMBER =~ ^[0-9]+$ ]]
do
    echo -e "\nThat is not an integer, guess again:"
    read INPUT_NUMBER
done

# checking if the user has guessed the correct secret number
until (( INPUT_NUMBER == SECRET_NUMBER ))
do
    if (( INPUT_NUMBER > SECRET_NUMBER ))
    then
        echo -e "\nIt's lower than that, guess again:"
    else
        echo -e "\nIt's higher than that, guess again:"
    fi
     (( NUMBER_OF_GUESSES++ ))
    read INPUT_NUMBER
done

# insert the game data into the games table using the user_id
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
INSERT_GAME_DATA=$($PSQL "INSERT INTO games(number_of_guesses, user_id) VALUES($NUMBER_OF_GUESSES, $USER_ID)")

# final display message for the user
if [[ $NUMBER_OF_GUESSES -eq 1 ]]
then
  echo -e "\nYou guessed it in $NUMBER_OF_GUESSES try. The secret number was $SECRET_NUMBER. Nice job!"
else
  echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
fi