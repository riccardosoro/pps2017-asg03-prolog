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

% size(List,Size)
% Size will contain the number of elements in List
size([],0).
size([_|T],M) :- size(T,N), M is N+1.

% size2(List,Size)
% Size2 will contain the number of elements in List,written using notation zero, s(zero), s(s(zero))..
size2([],zero).
size2([_|T],M) :- size2(T,N), M = s(N).

% sum(List,Sum)
sum([],0).
sum([H|T],M) :- sum(T,N), M is N+H.