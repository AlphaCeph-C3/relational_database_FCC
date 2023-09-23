# PSQL variable for database query
PSQL="psql --username=freecodecamp --dbname=periodic_table -t -A -c"

if [[ ! $1 ]]
then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    CONDITION="atomic_number=$1"
  else
    CONDITION="symbol='$1' OR name='$1'"
  fi
  ELEMENT=$($PSQL "SELECT atomic_number, name, symbol,type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE $CONDITION")
  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    echo $ELEMENT | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi
fi