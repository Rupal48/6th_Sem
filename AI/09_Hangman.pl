% Define the secret word
secret_word(apple).

% Define a predicate to display the word with guessed letters
display_word(Word, GuessedLetters, Display) :-
    atom_chars(Word, WordChars),
    display_word_chars(WordChars, GuessedLetters, DisplayChars),
    atom_chars(Display, DisplayChars).

display_word_chars([], _, []).
display_word_chars([Char|Word], GuessedLetters, [Char|DisplayRest]) :-
    member(Char, GuessedLetters),
    !,
    display_word_chars(Word, GuessedLetters, DisplayRest).
display_word_chars([_|Word], GuessedLetters, ['_'|DisplayRest]) :-
    display_word_chars(Word, GuessedLetters, DisplayRest).

% Define a predicate to check if the guessed letter is in the word
guessed_letter_in_word(Letter, Word) :-
    atom_chars(Word, WordChars),
    member(Letter, WordChars).

% Define a predicate to remove duplicates from a list
remove_duplicates([], []).
remove_duplicates([X|Xs], Ys) :-
    member(X, Xs),
    !,
    remove_duplicates(Xs, Ys).
remove_duplicates([X|Xs], [X|Ys]) :-
    remove_duplicates(Xs, Ys).

% Define the main hangman game
hangman :-
    writeln('Welcome to Hangman!'),
    secret_word(Word),
    hangman_loop(Word, []).

hangman_loop(Word, GuessedLetters) :-
    display_word(Word, GuessedLetters, Display),
    writeln(Display),
    (   atom_chars(Display, DisplayChars),
        member('_', DisplayChars) ->
        read_letter(GuessedLetters, Letter),
        (   guessed_letter_in_word(Letter, Word) ->
            writeln('Good guess!'),
            hangman_loop(Word, [Letter|GuessedLetters])
        ;   writeln('Incorrect guess!'),
            hangman_loop(Word, GuessedLetters)
        )
    ;   writeln('Congratulations! You guessed the word.')
    ).

read_letter(GuessedLetters, Letter) :-
    write('Guess a letter: '),
    read_line_to_string(user_input, Input),
    atom_chars(Input, [LetterChar]),
    char_type(LetterChar, alpha),
    atom_string(Letter, [LetterChar]),
    \+ member(Letter, GuessedLetters).