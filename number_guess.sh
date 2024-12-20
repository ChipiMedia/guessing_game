#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "ENTER your username: "
read USERNAME

USER_RECORDD=$(PSQL "SELECT user_id, games played, best_game FROM users WHERE username='$USERNAME'")


if [[ -z $USER_RECORD ]]
then
echo "Welcome, $USERNAME! It looks like this is your first time here."
$PSQL "INSERT INTO users (username VALUES '$USERNAME')"
else 
  IFS="|" read USER_ID GAMES_PLAYED BEST_GAME <<< "$USER_RECORD"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUMBER=$((RANDOM % 1000 +1))
echo "The secret number is $SECRET_NUMBER (for testing purposes)."
