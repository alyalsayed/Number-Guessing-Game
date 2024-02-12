#!/bin/bash

# variable to query database
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"


# promp player for username
echo -e "\nEnter your username:"
read USERNAME

# get username data
USERNAME_RESULT=$($PSQL "SELECT username FROM players WHERE username='$USERNAME'")
# get user id
USER_ID_RESULT=$($PSQL "SELECT user_id FROM players WHERE username='$USERNAME'")

# if player is not found
if [[ -z $USERNAME_RESULT ]]
  then
    # greet player
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here.\n"
    # add player to database
    INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO players(username) VALUES ('$USERNAME')")
  else
    
    GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games LEFT JOIN players USING(user_id) WHERE username='$USERNAME'")
    BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games LEFT JOIN players USING(user_id) WHERE username='$USERNAME'")

    echo Welcome back, $USERNAME\! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi

# generate random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# variable to store number of guesses/tries
GUESS_COUNT=0

# prompt first guess
echo "Guess the secret number between 1 and 1000:"
read USER_GUESS


# loop to prompt user to guess until correct
until [[ $USER_GUESS == $SECRET_NUMBER ]]
do
  
  # check guess is valid/an integer
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
    then
      # request valid guess
      echo -e "\nThat is not an integer, guess again:"
      read USER_GUESS
      # update guess count
      ((GUESS_COUNT++))
    
    # if its a valid guess
    else
      # check inequalities and give hint
      if [[ $USER_GUESS < $SECRET_NUMBER ]]
        then
          echo "It's higher than that, guess again:"
          read USER_GUESS
          # update guess count
          ((GUESS_COUNT++))
        else 
          echo "It's lower than that, guess again:"
          read USER_GUESS
          #update guess count
          ((GUESS_COUNT++))
      fi  
  fi

done

# loop ends when guess is correct so, update guess
((GUESS_COUNT++))

# get user id
USER_ID_RESULT=$($PSQL "SELECT user_id FROM players WHERE username='$USERNAME'")
# add result to game history/database
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, secret_number, number_of_guesses) VALUES ($USER_ID_RESULT, $SECRET_NUMBER, $GUESS_COUNT)")

# winning message
echo You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job\!


# ----------------
# #!/bin/bash

# # PostgreSQL connection command
# PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# # Declare global variables
# username=""
# games_played=0
# best_game=0

# # Function to get user information from the database
# get_user_info() {
#     username="$1"
#     user_info=$($PSQL "SELECT games_played, best_game FROM users WHERE username = '$username';")
#     IFS='|' read -ra info <<< "$user_info"
#     games_played=${info[0]}
#     best_game=${info[1]}
# }


# # Function to generate a random number between 1 and 1000
# generate_secret_number() {
#     echo $((1 + RANDOM % 1000))
# }

# # Function to check if a username is valid (at most 22 characters)
# is_valid_username() {
#     local username="$1"
#     if [ ${#username} -le 22 ]; then
#         return 0
#     else
#         return 1
#     fi
# }

# user_exists() {
#     local username="$1"
#     exists=$($PSQL "SELECT EXISTS (SELECT 1 FROM users WHERE username='$username');")
#     if [ "$exists" = "t" ]; then
#         return 0
#     else
#         return 1
#     fi
# }



# # Function to update user information in the database
# update_user_info() {
#     username="$1"
#     games_played="$2"
#     best_game="$3"
#     $PSQL "UPDATE users SET games_played = $games_played, best_game = $best_game WHERE username = '$username';"
# }

# # Function to insert new user into the database
# insert_new_user() {
#     $PSQL "INSERT INTO users (username, games_played, best_game) VALUES ('$username', 0, 0);"
# }

# # Function to play the game
# play_game() {
#     local secret_number="$1"
#     local number_of_guesses=0

#     while true; do
#         echo  "Guess the secret number between   1 and   1000: " 
#         read guess
#         if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
#             echo "That is not an integer, guess again:"
#         else
#             ((number_of_guesses++))
#             if [ "$guess" -eq "$secret_number" ]; then
#                 echo "You guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!"
#                 # Update the best game if it's the first game or fewer guesses were made
#                 if [ "$best_game" -eq   0 ] || [ "$number_of_guesses" -lt "$best_game" ]; then
#                     best_game="$number_of_guesses"
#                 fi
#                 return   0
#             elif [ "$guess" -lt "$secret_number" ]; then
#                 echo "It's higher than that, guess again:"
#             else
#                 echo "It's lower than that, guess again:"
#             fi
#         fi
#     done
# }

# echo "Enter your username:"
# read username

# if is_valid_username "$username"; then
#     if $(user_exists "$username"); then
#         get_user_info "$username"
#         echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
#     else
#         echo "Welcome, $username! It looks like this is your first time here."
#         insert_new_user "$username"
#         games_played=0
#         best_game=0
#     fi

#     secret_number=$(generate_secret_number)
#     play_game "$secret_number"

#     # Update user information
#     UPDATE_RESULT=$(update_user_info "$username" $((games_played +   1)) $best_game)
# else
#     echo "Invalid username. Username should be at most   22 characters long."
# fi