% Define a predicate to remove punctuations from a string
remove_punctuation(InputString, CleanString) :-
    atom_chars(InputString, InputChars),    % Convert the input string to a list of characters
    remove_punctuation_chars(InputChars, CleanChars), % Remove punctuations from the list of characters
    atom_chars(CleanString, CleanChars).    % Convert the list of characters back to a string

% Base case: If the list is empty, return an empty list
remove_punctuation_chars([], []).

% If the current character is a punctuation mark, skip it
remove_punctuation_chars([Char | Rest], CleanChars) :-
    punctuation(Char),
    !,
    remove_punctuation_chars(Rest, CleanChars).

% If the current character is not a punctuation mark, keep it
remove_punctuation_chars([Char | Rest], [Char | CleanRest]) :-
    \+ punctuation(Char),
    remove_punctuation_chars(Rest, CleanRest).

% Define a predicate to check if a character is a punctuation mark
punctuation(Char) :-
    member(Char, ['.', ',', ';', ':', '!', '?', '-', '(', ')', '[', ']', '{', '}', '"', '''', '`']).