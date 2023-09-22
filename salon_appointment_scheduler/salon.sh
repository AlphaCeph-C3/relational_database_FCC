#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ UNISEX Salon ~~~~~\n"
echo -e "Welcome, How may I help you?\n"

# display services list
BOOKING_APPOINTMENT () {
  if [[ $1 ]]
  then
   echo -e "\n$1"
  fi
  # display services list
  SERVICES=$($PSQL "SELECT * FROM services")
  echo "$SERVICES" | while read SERVICE_ID_TO_SELECT BAR SERVICE
  do
    echo "$SERVICE_ID_TO_SELECT) $SERVICE"
  done
  # get the service the customer wants
  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[1-7]$ ]]
  then
    BOOKING_APPOINTMENT "I could not find that service. What would you like today?\n"
  else
    # GET THE SERVICE NAME
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    SERVICE_NAME_FORMATTED=$(echo $SERVICE_NAME | sed -E 's/^ *| *$//g')
    # ask for phone number to get customer info from database
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    # get customer name
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    # if not found
    if [[ -z $CUSTOMER_NAME ]]
    then
      # ask for the name
      echo -e "\nWhat is your name?"
      read CUSTOMER_NAME
      # insert the data in database
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi
    CUSTOMER_NAME_FORMATTED=$(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')
    # get customer id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    # ask for the time to schedule appointment
    echo -e "\nAt what time would you like your $SERVICE_NAME_FORMATTED, $CUSTOMER_NAME_FORMATTED?"
    read SERVICE_TIME
    # insert the appointment into the appointments table
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(service_id, customer_id, time) VALUES($SERVICE_ID_SELECTED, $CUSTOMER_ID, '$SERVICE_TIME')")
    echo $INSERT_APPOINTMENT_RESULT
    if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
    then
    # final output message
      echo -e "\nI have put you down for a $SERVICE_NAME_FORMATTED at $SERVICE_TIME, $CUSTOMER_NAME_FORMATTED."
    else
      echo -e "\nThere was a technical error please try again.\n"
    fi
  fi
}

BOOKING_APPOINTMENT