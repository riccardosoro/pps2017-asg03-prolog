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

% average(List,Average)
% it uses average(List,Count,Sum,Average)
average(List,A) :- average(List,0,0,A).
average([],C,S,A) :- A is S/C.
average([X|Xs],C,S,A) :-
C2 is C+1,
S2 is S+X,
average(Xs,C2,S2,A).

% ES:2.5
% max(List,Max)
% Max is the biggest element in List
% Suppose the list has at least one element
max([X|Xs],A) :- max(Xs,X,A).
max([],A,A).
%caso in cui trovo un numero più grande
max([X|Xs],C,A) :-
C<X,C2 is X,
max(Xs,C2,A).
%caso in cui trovo un numero più piccolo
max([X|Xs],C,A) :-
C>=X,C2 is C,
max(Xs,C2,A).


% ES 3.1
% same(List1,List2)
% are the two lists the same?
same([],[]).
same([X|Xs],[X|Ys]):- same(Xs,Ys).

% ES 3.2
% all_bigger(List1,List2)
% all elements in List1 are bigger than those in List2, 1 by 1
% example: all_bigger([10,20,30,40],[9,19,29,39]).
all_bigger([],[]).
all_bigger([X|Xs],[Y|Ys]) :-
X>Y,
all_bigger(Xs,Ys).

% ES 3.3
% sublist(List1,List2)
% List1 should be a subset of List2
% example: sublist([1,2],[5,3,2,1]).
sublist([X|Xs],List):-
search(X,List),
sublist(Xs,List).
sublist([],List).

