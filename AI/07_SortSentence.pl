% Define a predicate to split a sentence into words
split_sentence(Sentence, Words) :-
    atomic_list_concat(Words, ' ', Sentence).

% Define a predicate to sort a list of words alphabetically
sort_words(Words, SortedWords) :-
    sort(Words, SortedWords).

% Define a predicate to join words into a sentence
join_words(Words, Sentence) :-
    atomic_list_concat(Words, ' ', Sentence).

% Define a predicate to sort the words in a sentence alphabetically
sort_sentence(InputSentence, SortedSentence) :-
    split_sentence(InputSentence, Words),
    sort_words(Words, SortedWords),
    join_words(SortedWords, SortedSentence).