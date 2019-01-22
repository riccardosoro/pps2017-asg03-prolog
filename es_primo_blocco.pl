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


% ES 4.1
% seq(N,List)
% example: seq(5,[0,0,0,0,0]).
seq(0,[]).
seq(N,[0|T]):- N > 0, N2 is N-1, seq(N2,T).
%Is it fully relational? NO

% ES 4.2
% seqR(N,List)
% example: seqR(4,[4,3,2,1,0]).
seqR(N,[X|Xs]) :-
N is X,
N2 is N-1,
seqR(N2,Xs).
seqR(0,[0]).

% ES 4.3
% seqR2(N,List)
% example: seqR2(4,[0,1,2,3,4]).
seqR2(N,List) :- seqR2(N,N,List).
seqR2(N,M,[X|Xs]):-
N>=0,
N is M-X,
N2 is N-1,
seqR2(N2,M,Xs).
seqR2(-1,_,[]).



% inv(List,List)
% example: inv([1,2,3],[3,2,1]).
inv(Xs,Ys) :-
inv(Xs,[],Ys). % metto una lista temporanea in mezzo
inv([X|Xs],T,R) :-  % scorro la prima lista e aggiungo gli elementi alla lista temporanea
inv(Xs,[X|T],R).
inv([],R,R).    % mi sono passato tutta la lista

% double(List,List)
% suggestion: remember predicate append/3
% example: double([1,2,3],[1,2,3,1,2,3]).
double([],[]).
double(List1,List2):-
append(List1,List1,List2).

% times(List,N,List)
% example: times([1,2,3],3,[1,2,3,1,2,3,1,2,3]).
times(List1,N,List2):-times(List1,N,List2,[]).
times(List1,N,List2,ListTmp):-
N>0,
N2 is N-1,
append(ListTmp,List1,ListTmp2),
times(List1,N2,List2,ListTmp2).
times(_,0,R,R).