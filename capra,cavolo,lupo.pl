%Scrivere un programma Prolog che determini se esiste una soluzione del problema del contadino che dovendo attraversare il fiume con una barca a due posti ed avendo con se una capra,
%un cavolo ed un lupo, deve evitare di lasciare da soli lupo e capra oppure capra e cavolo.


sponda1(X,Y):- compatibilita(X,Y).
sponda2(X,Y):- compatibilita(X,Y).
barca(X).

compatibilita(X,Y):- X = lupo,
										 Y = cavolo; Y = vuoto.
compatibilita(X,Y):- X = cavolo,
										 Y = lupo ; Y = vuoto.
compatibilita(X,Y):- X = capra, Y = vuoto.
compatibilita(X,X):- X = vuoto.


game(X1,X2,X3,X4,X5):-checkNumber(X1,X2,X3,X4,X5),sponda1(X1,X2),sponda2(X4,X5),barca(X3).


checkNumber(X1,X2,X5,X3,X4):-checkElement(0,0,0,0,X1,R11,R12,R13,R14),checkElement(R11,R12,R13,R14,X2,R21,R22,R23,R24),
														checkElement(R21,R22,R23,R24,X3,R31,R32,R33,R34),checkElement(R31,R32,R33,R34,X4,R41,R42,R43,R44),checkElement(R41,R42,R43,R44,X5,1,1,1,2).




checkElement(Nlupo,Ncavolo,Ncapra,Nvuoto,X,Nlupo2,Ncavolo2,Ncapra2,Nvuoto2):-X = lupo, Nlupo2 is Nlupo+1,Ncavolo2 is Ncavolo, Ncapra2 is Ncapra, Nvuoto2 is Nvuoto.
checkElement(Nlupo,Ncavolo,Ncapra,Nvuoto,X,Nlupo2,Ncavolo2,Ncapra2,Nvuoto2):-X = cavolo, Nlupo2 is Nlupo,Ncavolo2 is Ncavolo+1, Ncapra2 is Ncapra, Nvuoto2 is Nvuoto.
checkElement(Nlupo,Ncavolo,Ncapra,Nvuoto,X,Nlupo2,Ncavolo2,Ncapra2,Nvuoto2):-X = capra, Nlupo2 is Nlupo,Ncavolo2 is Ncavolo, Ncapra2 is Ncapra+1, Nvuoto2 is Nvuoto.
checkElement(Nlupo,Ncavolo,Ncapra,Nvuoto,X,Nlupo2,Ncavolo2,Ncapra2,Nvuoto2):-X = vuoto, Nlupo2 is Nlupo,Ncavolo2 is Ncavolo, Ncapra2 is Ncapra , Nvuoto2 is Nvuoto+1.

nextMove(X1,X2,X3,X4,X5):-X3 = vuoto, X1 = vuoto, X2 = vuoto, write(fine).
nextMove(X1,X2,X3,X4,X5):-X1 = vuoto, X3 = vuoto, nextMove(X1,vuoto,X2,X4,X5).%se ho posto e ne rimane solo uno carico
nextMove(X1,X2,X3,X4,X5):-X2 = vuoto, X3 = vuoto, nextMove(vuoto,X2,X1,X4,X5).%se ho posto e ne rimane solo uno carico
nextMove(X1,X2,X3,X4,X5):-X4 = vuoto, X5 = vuoto, nextMove(X1,X2,vuoto,X3,X5).%scarico quello che ho sulla barca
nextMove(X1,X2,X3,X4,X5):-X3 = vuoto, X1 \= vuoto,X2 \= vuoto , nextMove(X1,X2,vuoto,X3,X5).%barca libera, carico

inizialGame:-game(X,Y,Z,vuoto,vuoto)



