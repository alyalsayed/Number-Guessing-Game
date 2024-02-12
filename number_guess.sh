#!/bin/bash

# PostgreSQL connection command
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Declare global variables
username=""
games_played=0
best_game=0

# Function to get user information from the database
get_user_info() {
    username="$1"
    user_info=$($PSQL "SELECT games_played, best_game FROM users WHERE username = '$username';")
    IFS='|' read -ra info <<< "$user_info"
    games_played=${info[0]}
    best_game=${info[1]}
}

# Function to generate a random number between 1 and 1000
generate_secret_number() {
    echo $((1 + RANDOM % 1000))
}

# Function to check if a username is valid (at most 22 characters)
is_valid_username() {
    local username="$1"
    if [ ${#username} -le 22 ]; then
        return 0
    else
        return 1
    fi
}

user_exists() {
    local username="$1"
    exists=$($PSQL "SELECT EXISTS (SELECT 1 FROM users WHERE username='$username');")
    if [ "$exists" = "t" ]; then
        return 0
    else
        return 1
    fi
}

# Function to update user information in the database
update_user_info() {
    username="$1"
    games_played="$2"
    best_game="$3"
    $PSQL "UPDATE users SET games_played = $games_played, best_game = $best_game WHERE username = '$username';"
}

# Function to insert new user into the database
insert_new_user() {
    $PSQL "INSERT INTO users (username, games_played, best_game) VALUES ('$username', 0, 0);"
}

# Function to play the game
play_game() {
    local secret_number="$1"
    local number_of_guesses=0

    while true; do
        echo  "Guess the secret number between   1 and   1000: " 
        read guess
        ((number_of_guesses++))
        if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
            echo "That is not an integer, guess again:" 
        else
            if [ "$guess" -eq "$secret_number" ]; then
                echo "You guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!"
                # Update the best game if it's the first game or fewer guesses were made
                if [ "$best_game" -eq   0 ] || [ "$number_of_guesses" -lt "$best_game" ]; then
                    best_game="$number_of_guesses"
                fi
                return   0
            elif [ "$guess" -lt "$secret_number" ]; then
                echo "It's higher than that, guess again:"
            else
                echo "It's lower than that, guess again:"
            fi
        fi
    done
}

echo  "Enter your username:"
read username

if is_valid_username "$username"; then
    if $(user_exists "$username"); then
        get_user_info "$username"
        echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
    else
        echo "Welcome, $username! It looks like this is your first time here."
        insert_new_user "$username"
        games_played=0
        best_game=0
    fi

    secret_number=$(generate_secret_number)
    play_game $secret_number
$((games_played++))
    # Update user information
    UPDATE_RESULT=$(update_user_info "$username" "$games_played" "$best_game")
else
    echo "Invalid username. Username should be at most   22 characters long."
fi

