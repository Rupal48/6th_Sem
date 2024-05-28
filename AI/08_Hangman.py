import random

def choose_word():
    # List of words for the game
    words = ["apple", "banana", "orange", "grape", "watermelon", "strawberry", "pineapple", "kiwi"]
    return random.choice(words)

def display_word(word, guessed_letters):
    # Display the word with dashes for missing letters
    display = ""
    for letter in word:
        if letter in guessed_letters:
            display += letter
        else:
            display += "_"
    return display

def hangman():
    print("Welcome to Hangman!")
    word = choose_word()
    guessed_letters = []
    attempts_left = 6

    while True:
        print("\nAttempts left:", attempts_left)
        print(display_word(word, guessed_letters))

        if "_" not in display_word(word, guessed_letters):
            print("\nCongratulations! You guessed the word:", word)
            break

        guess = input("Guess a letter: ").lower()

        if guess in guessed_letters:
            print("You already guessed that letter. Try again.")
        elif len(guess) != 1 or not guess.isalpha():
            print("Please enter a single letter.")
        else:
            guessed_letters.append(guess)
            if guess in word:
                print("Good guess!")
            else:
                print("Incorrect guess!")
                attempts_left -= 1
                if attempts_left == 0:
                    print("Sorry, you ran out of attempts. The word was:", word)
                    break

hangman()