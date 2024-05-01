#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
#--------------------------------------------------------------------------------------------------------------

##Clear console
clear
#--------------------------------------------------------------------------------------------------------------

##Clearing the database and resetting indexes
#clearing DATABASE
echo $($PSQL "TRUNCATE games, teams")
#Resetting ID SEQUENCING
echo $($PSQL "ALTER SEQUENCE teams_team_id_seq RESTART WITH 1")
echo $($PSQL "ALTER SEQUENCE games_game_id_seq RESTART WITH 1")
#--------------------------------------------------------------------------------------------------------------

##INSERTING DATA INTO DATABASE
#looping over all csv file items.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WIN_GOALS OP_GOALS
do
  #ignoring csv column names
  if [[ $YEAR != 'year' ]]
  then
    #----------------- CHECK if teams exist in DATABASE---------------------#
    #check winner_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    #if not exist
    if [[ -z $WINNER_ID ]]
    then
      #add to teams
      echo $($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    fi
    #----------------------------------------------------------------------#
    ## CHECK if Loser team in DATABASE
    #check opponent_id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    #if not exist
    if [[ -z $OPPONENT_ID ]]
    then
      #Add opponent to teams
      echo $($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    fi
    #----------------- Add games to DATABASE---------------------#
    echo $($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
                              VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WIN_GOALS, $OP_GOALS)")
    #add match data
  fi
done
