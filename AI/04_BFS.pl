% Define a simple graph using adjacency list representation
edge(a, b).
edge(a, c).
edge(b, d).
edge(c, e).
edge(c, f).
edge(d, g).
edge(e, h).
edge(f, i).

% breadth_first_search(Start, VisitedNodes)
% Perform BFS traversal starting from Start node
breadth_first_search(Start, VisitedNodes) :-
    bfs([Start], [], VisitedNodes).

% bfs(ToVisit, Visited, Result)
% Perform BFS traversal given nodes to visit, visited nodes, and result
bfs([], Visited, Visited).
bfs([Current | RestToVisit], Visited, Result) :-
    % Check if the current node has not been visited yet
    \+ member(Current, Visited),
    % Get all neighbors of the current node
    findall(Neighbor, edge(Current, Neighbor), Neighbors),
    % Add neighbors that have not been visited yet to the to-visit list
    append(RestToVisit, Neighbors, UpdatedToVisit),
    % Add the current node to the visited list
    bfs(UpdatedToVisit, [Current | Visited], Result).
bfs([_ | RestToVisit], Visited, Result) :-
    % If the current node has been visited, continue with the rest of the to-visit list
    bfs(RestToVisit, Visited, Result).