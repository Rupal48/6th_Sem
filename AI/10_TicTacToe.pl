% Define the initial state of the game board
initial_board([
    ['_', '_', '_'],
    ['_', '_', '_'],
    ['_', '_', '_']
]).

% Define a predicate to display the game board
display_board(Board) :-
    nl,
    display_row_separator,
    display_rows(Board).

display_rows([]).
display_rows([Row | RestRows]) :-
    display_row(Row),
    display_row_separator,
    display_rows(RestRows).

display_row([]) :- write('|'), nl.
display_row([Cell | RestCells]) :-
    write('| '), write(Cell), display_row(RestCells).

display_row_separator :-
    write('|---|---|---|'), nl.

% Define a predicate to check if a player has won
win(Board, Player) :-
    % Check rows
    (   member([Player, Player, Player], Board)
    % Check columns
    ;   transpose(Board, TransposedBoard),
        member([Player, Player, Player], TransposedBoard)
    % Check diagonals
    ;   diagonals(Board, Diagonals),
        member([Player, Player, Player], Diagonals)
    ).

% Transpose a matrix
transpose(Matrix, Transposed) :-
    transpose(Matrix, Transposed, []).

transpose([], Transposed, Transposed).
transpose([[] | RestRows], Transposed, Acc) :-
    transpose(RestRows, Transposed, Acc).
transpose([[X | Xs] | RestRows], Transposed, Acc) :-
    first_column(RestRows, X, RestRows1),
    append(Acc, [[X | FirstColumn] | TransposedRest], Transposed),
    transpose(RestRows1, TransposedRest, FirstColumn).

first_column([], [], []).
first_column([[X | Xs] | Rows], [X | XColumn], [Xs | RestColumns]) :-
    first_column(Rows, XColumn, RestColumns).

% Get the diagonals of a matrix
diagonals(Board, Diagonals) :-
    diagonals(Board, [], Diagonals).

diagonals([], Diagonals, Diagonals).
diagonals(Board, Acc, Diagonals) :-
    diagonal(Board, Diagonal),
    append(Acc, [Diagonal], Acc1),
    rest_of_board(Board, Rest),
    diagonals(Rest, Acc1, Diagonals).

diagonal([], []).
diagonal([[X | _] | RestRows], [X | RestDiagonal]) :-
    diagonal(RestRows, RestDiagonal).

rest_of_board([], []).
rest_of_board([[_ | Xs] | RestRows], [Xs | Rest]) :-
    rest_of_board(RestRows, Rest).

% Define a predicate to check if the game is over (either a player has won or the board is full)
game_over(Board, Winner) :-
    (   win(Board, 'X'), Winner = 'X'
    ;   win(Board, 'O'), Winner = 'O'
    ;   board_full(Board)
    ).

board_full(Board) :-
    \+ (member(Row, Board), member('_', Row)).

% Define a predicate to make a move
make_move(Board, Row, Column, Player, NewBoard) :-
    nth1(Row, Board, OldRow),
    replace_element(OldRow, Column, Player, NewRow),
    replace_element(Board, Row, NewRow, NewBoard).

replace_element([_ | Tail], 1, Element, [Element | Tail]).
replace_element([Head | Tail1], Index, Element, [Head | Tail2]) :-
    Index > 1,
    Index1 is Index - 1,
    replace_element(Tail1, Index1, Element, Tail2).

% Define a predicate to play the game
play :-
    initial_board(Board),
    display_board(Board),
    play(Board, 'X').

play(Board, Player) :-
    (   game_over(Board, Winner) ->
        (   Winner = 'X' -> writeln('Player X wins!')
        ;   Winner = 'O' -> writeln('Player O wins!')
        ;   writeln('It\'s a draw!')
        )
    ;   read_move(Row, Column),
        (   valid_move(Board, Row, Column) ->
            make_move(Board, Row, Column, Player, NewBoard),
            display_board(NewBoard),
            switch_player(Player, NextPlayer),
            play(NewBoard, NextPlayer)
        ;   writeln('Invalid move!'),
            play(Board, Player)
        )
    ).

switch_player('X', 'O').
switch_player('O', 'X').

read_move(Row, Column) :-
    writeln('Enter your move (row, column): '),
    read_line_to_codes(user_input, Input),
    atom_codes(RowColumn, Input),
    atomic_list_concat([Row, Column], ',', RowColumn),
    atom_number(Row, Row),
    atom_number(Column, Column).

valid_move(Board, Row, Column) :-
    nth1(Row, Board, RowList),
    nth1(Column, RowList, Cell),
    Cell == '_'.