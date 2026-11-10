# Number Guessing Game

A PostgreSQL-backed command-line number guessing game built with Bash. Players enter a username, try to guess a random number between 1 and 1000, and their game statistics are stored persistently in a database.

This project was completed as part of the freeCodeCamp Relational Database curriculum and demonstrates how to combine a Bash script with PostgreSQL for a real-world interactive application.

## Overview

The game:

- prompts the player for a username
- creates a new user record the first time they play
- loads past stats for returning players
- generates a random secret number between 1 and 1000
- gives hints such as "higher" or "lower" until the correct guess is made
- tracks how many guesses it took and stores the best result

## Features

- Username validation with a maximum length of 22 characters
- Personalized welcome messages for new and returning players
- Randomized secret number generation
- Integer validation for player input
- Feedback after each guess using higher/lower hints
- Persistent score tracking using PostgreSQL
- Best-game tracking for each username

## Project Structure

```text
.
├── README.md               # Project documentation
├── number_guess.sh         # Bash script for the game logic
├── number_guess.sql        # PostgreSQL database schema and setup
├── submit.PNG             # Project submission screenshot
└── .gitignore              # Git metadata (if present locally)
```

## Prerequisites

Before running the project, ensure you have:

- PostgreSQL installed and running
- `psql` available in your shell PATH
- Bash installed on your system

## Database Setup

The project uses a database named `number_guess`.

To restore the database schema and create the required table:

```bash
psql -U freecodecamp -d postgres < number_guess.sql
```

If the database already exists, you can also connect directly:

```bash
psql --username=freecodecamp --dbname=number_guess
```

## Running the Game

Make the script executable:

```bash
chmod +x number_guess.sh
```

Start the game:

```bash
./number_guess.sh
```

## Example Gameplay

```text
Enter your username:
Aly
Welcome, Aly! It looks like this is your first time here.
Guess the secret number between 1 and 1000:
500
It's lower than that, guess again:
750
It's higher than that, guess again:
600
...
You guessed it in 7 tries. The secret number was 600. Nice job!
```

## Database Schema

The database contains a `users` table with the following structure:

```sql
CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);
```

This table stores:

- `username`: unique player identifier
- `games_played`: total games played by the user
- `best_game`: best score in terms of fewest guesses

## How the Script Works

The `number_guess.sh` script performs the following steps:

1. Connects to the PostgreSQL database using `psql`
2. Prompts the user for a username
3. Checks whether the user already exists
4. Loads previous stats for returning players
5. Generates a random number between 1 and 1000
6. Accepts guesses until the correct number is found
7. Validates integer input and provides feedback
8. Updates the database with the final game result

## Project Notes

This project is a practical example of:

- Bash scripting
- PostgreSQL database interaction
- input validation
- state persistence
- user stats tracking

It is especially useful for learning how to build small interactive applications that store data in a relational database.

## Verification

To test the project locally:

```bash
chmod +x number_guess.sh
./number_guess.sh
```

Then try a few inputs such as:

- a valid username
- a returning user
- integer guesses
- non-numeric input
- a correct guess

## FreeCodeCamp Reference

This project was built based on the freeCodeCamp relational database project requirements for a Number Guessing Game.

## Screenshot

```text
submit.PNG
```

The repository includes a project submission screenshot showing the completed result.
