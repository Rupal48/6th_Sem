import os
import random

board = ["-","-","-",
         "-","-","-",
         "-","-","-"]

def get_grid_input():
    if "-" not in board:
        print("It's a draw!")
        return
    print("Enter the position you want to place your move: ")
    position = input()
    if position not in ["1", "2", "3", "4", "5", "6", "7", "8", "9"]:
        print("Invalid input. Please enter a number between 1 and 9")
        return get_grid_input()

    if board[int(position) - 1] != "-":
        print("Position already taken. Please select another position")
        return get_grid_input()
    return position

def display_board():
    print(board[0] + " | " + board[1] + " | " + board[2] + "      " + "1|2|3")
    print(board[3] + " | " + board[4] + " | " + board[5] + "      " + "4|5|6")
    print(board[6] + " | " + board[7] + " | " + board[8] + "      " + "7|8|9")

def check_winner():
    # Check rows
    if board[0] == board[1] == board[2] and board[0] != "-":
        return board[0]
    if board[3] == board[4] == board[5] and board[3] != "-":
        return board[3]
    if board[6] == board[7] == board[8] and board[6] != "-":
        return board[6]
    # Check columns
    if board[0] == board[3] == board[6] and board[0] != "-":
        return board[0]
    if board[1] == board[4] == board[7] and board[1] != "-":
        return board[1]
    if board[2] == board[5] == board[8] and board[2] != "-":
        return board[2]
    # Check diagonals
    if board[0] == board[4] == board[8] and board[0] != "-":
        return board[0]
    if board[2] == board[4] == board[6] and board[2] != "-":
        return board[2]
    return "-"


def single_player():
    print("Single Player Mode")

    while True:
        display_board()
        print("X's turn")
        position = int(get_grid_input()) - 1
        board[position] = "X"
        os.system('cls')

        winner = check_winner()
        if winner != "-":
            display_board()
            print(winner,"wins!")
            break

        position = random.randint(0, 8)
        while board[position] != "-":
            position = random.randint(0, 8)
        board[position] = "O"
        os.system('cls')
    
        winner = check_winner()
        if winner != "-":
            display_board()
            print(winner,"wins!")
            break
    
def multi_player():
    print("Multiplayer Mode")

    while True:
        display_board()
        print("X's turn")
        position = int(get_grid_input()) - 1
        board[position] = "X"
        os.system('cls')

        winner = check_winner()
        if winner != "-":
            display_board()
            print(winner,"wins!")
            break

        display_board()
        print("O's turn")
        position = int(get_grid_input()) - 1
        board[position] = "O"
        os.system('cls')

        winner = check_winner()
        if winner != "-":
            display_board()
            print(winner,"wins!")
            break
        
def game():
    mode = input("Select mode: 1. Single Player 2. Multiplayer: ")
    if mode == "1":
        single_player()
    elif mode == "2":
        multi_player()
    else:
        print("Invalid input. Please select 1 or 2")
        game()

game()
input()