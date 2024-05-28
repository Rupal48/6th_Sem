% Define the capacity of the jugs
jug_capacity(jug(3)).
jug_capacity(jug(5)).

% Define the initial state of the jugs (empty)
initial_state(state(0, 0)).

% Define the final state of the jugs (one of them contains 4 liters)
final_state(state(4, _)).
final_state(state(_, 4)).

% Define the actions that can be performed on the jugs
action(fill(X), state(_, Y), state(Capacity, Y)) :-
    jug_capacity(jug(Capacity)),
    member(X, [1, 2, 3, 4, 5, 6, 7, 8]),
    Capacity >= Y + X.

action(empty(X), state(_, Y), state(0, Y)) :-
    member(X, [1, 2, 3, 4, 5, 6, 7, 8]),
    Y >= X.

action(transfer(X, Y), state(X1, Y1), state(X2, Y2)) :-
    member(X, [1, 2, 3, 4, 5, 6, 7, 8]),
    member(Y, [1, 2, 3, 4, 5, 6, 7, 8]),
    X \= Y,
    % Ensure that we don't transfer more water than what is available
    (X1 + Y1) >= X,
    Y2 is min(Y1 + X1, Y),
    X2 is X1 - (Y2 - Y1).

% Define the breadth-first search algorithm
bfs([State | _], Path, State) :-
    final_state(State),
    reverse(Path, PathReversed),
    write('Solution Path: '), write(PathReversed), nl.

bfs([State | RestStates], Path, GoalState) :-
    findall(NewState, (action(Action, State, NewState), \+ member(NewState, [State | Path])), Children),
    append(RestStates, Children, NewStates),
    bfs(NewStates, [State | Path], GoalState).

% Solve the water jug problem
solve :-
    initial_state(InitialState),
    bfs([InitialState], [], FinalState).