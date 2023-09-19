#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\n~~ Starting the insert data script ~~\n"

# empty the tables first
echo "$($PSQL "TRUNCATE games, teams")"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WIN_GOALS OPPO_GOALS
do
  if [[ $YEAR != year ]]
  then
    # get winner id
    WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")"
    # if not found
    if [[ -z $WINNER_ID ]]
    then
      # insert the winner in teams table
      INSERT_WINNER_RESULT="$($PSQL "INSERT INTO teams(name) VALUES ('$WINNER')")"
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into teams table: $WINNER"
      fi
      # get new winner id from the teams table
      WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")"
    fi
    # get opponent id
    OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")"
    # if not found
    if [[ -z $OPPONENT_ID ]]
    then
      # insert the opponent in teams table
      INSERT_OPPONENT_RESULT="$($PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT')")"
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into teams table: $OPPONENT"
      fi
      # get new opponent id from the teams table
      OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")"
    fi
    # insert the table data with the newly accquired winner and opponent ids
    INSERT_GAME_DATA="$($PSQL "INSERT INTO games(year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES($YEAR, $WINNER_ID, $OPPONENT_ID, $WIN_GOALS, $OPPO_GOALS, '$ROUND')")"
    if [[ $INSERT_GAME_DATA == "INSERT 0 1" ]]
    then
      echo "Inserted game data of $ROUND"
    fi
  fi
done

echo -e "\n~~ DONE ~~\n"