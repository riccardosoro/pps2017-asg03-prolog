%search
search(X,[X|_]).
search(X,[_|Xs]):-search(X,Xs).

%search2(Elem,List)
search2(X,[X,X|_]).
search2(X,[_|Xs]):-search2(X,Xs).

% search_two(Elem,List)
% looks for two occurrences of Elem with an element in between!
search_two(X,[X,_,X|_]).
search_two(X,[_|Xs]):-search_two(X,Xs).

% search_anytwo(Elem,List)
% looks for any Elem that occurs two times
search_anytwo(X,[X|Xs]):-search(X,Xs).
search_anytwo(X,[_|Xs]):-search_anytwo(X,Xs).