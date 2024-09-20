#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "truncate games, teams")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINGOALS OPPGOALS
do
  if [[ $YEAR != year ]]
  then
    WINNER_ID=$($PSQL "select team_id from teams where name = '$WINNER'")
    OPPONENT_ID=$($PSQL "select team_id from teams where name = '$OPPONENT'")
    
    if [[ -z $WINNER_ID && -z $OPPONENT_ID ]]
    then
      echo $($PSQL "insert into teams(name) values ('$WINNER'),('$OPPONENT')")
    elif [[ -z $WINNER_ID ]]
    then
      echo $($PSQL "insert into teams(name) values ('$WINNER')")
    elif [[ -z $OPPONENT_ID ]]
    then
      echo $($PSQL "insert into teams(name) values ('$OPPONENT')")
    fi
    
    echo $($PSQL "select team_id from teams where name = '$WINNER' or name = '$OPPONENT' order by name") | while IFS=" " read TEAM1 TEAM2
    do
      if [[ $WINNER < $OPPONENT ]]
      then
        WINNER_ID=$TEAM1
        OPPONENT_ID=$TEAM2
      else
        WINNER_ID=$TEAM2
        OPPONENT_ID=$TEAM1
      fi
      echo $($PSQL "insert into games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) values ($YEAR, '$ROUND', $WINGOALS, $OPPGOALS, $WINNER_ID, $OPPONENT_ID)")
    done
  fi
done