vitoria(L,XY):- L = [XY,XY,XY,_,_,_,_,_,_];
                L = [_,_,_,XY,XY,XY,_,_,_];
                L = [_,_,_,_,_,_,XY,XY,XY];
                L = [XY,_,_,XY,_,_,XY,_,_];
                L = [_,XY,_,_,XY,_,_,XY,_];
                L = [_,_,XY,_,_,XY,_,_,XY];
                L = [XY,_,_,_,XY,_,_,_,XY];
                L = [_,_,XY,_,XY,_,XY,_,_].

moverIA([A,B,C,D,a,F,G,H,I], XY, [A,B,C,D,XY,F,G,H,I]).
moverIA([x,a,a,D,E,F,a,H,x], XY, [x,XY,a,D,E,F,a,H,x]).
moverIA([a,a,x,D,E,F,x,H,a], XY, [a,XY,x,D,E,F,x,H,a]).
moverIA([x,x,a,D,E,F,a,a,x], XY, [x,x,a,D,E,F,a,XY,x]).
moverIA([a,x,x,D,E,F,x,a,a], XY, [a,x,x,D,E,F,x,XY,a]).
moverIA([A,B,C,D,E,F,G,H,a], XY, [A,B,C,D,E,F,G,H,XY]).
moverIA([A,B,C,D,E,F,a,H,I], XY, [A,B,C,D,E,F,XY,H,I]).
moverIA([A,B,a,D,E,F,G,H,I], XY, [A,B,XY,D,E,F,G,H,I]).
moverIA([a,B,C,D,E,F,G,H,I], XY, [XY,B,C,D,E,F,G,H,I]).
moverIA([A,a,C,D,E,F,G,H,I], XY, [A,XY,C,D,E,F,G,H,I]).
moverIA([A,B,C,a,E,F,G,H,I], XY, [A,B,C,XY,E,F,G,H,I]).
moverIA([A,B,C,D,E,a,G,H,I], XY, [A,B,C,D,E,XY,G,H,I]).
moverIA([A,B,C,D,E,F,G,a,I], XY, [A,B,C,D,E,F,G,XY,I]).

moverJ([a,B,C,D,E,F,G,H,I], 1, [x,B,C,D,E,F,G,H,I]).
moverJ([A,a,C,D,E,F,G,H,I], 2, [A,x,C,D,E,F,G,H,I]).
moverJ([A,B,a,D,E,F,G,H,I], 3, [A,B,x,D,E,F,G,H,I]).
moverJ([A,B,C,a,E,F,G,H,I], 4, [A,B,C,x,E,F,G,H,I]).
moverJ([A,B,C,D,a,F,G,H,I], 5, [A,B,C,D,x,F,G,H,I]).
moverJ([A,B,C,D,E,a,G,H,I], 6, [A,B,C,D,E,x,G,H,I]).
moverJ([A,B,C,D,E,F,a,H,I], 7, [A,B,C,D,E,F,x,H,I]).
moverJ([A,B,C,D,E,F,G,a,I], 8, [A,B,C,D,E,F,G,x,I]).
moverJ([A,B,C,D,E,F,G,H,a], 9, [A,B,C,D,E,F,G,H,x]).

disp([A,B,C,D,E,F,G,H,I]) :-
	write('|'),
	write([A,B,C]),write('|'),nl,
	write('|'),
	write([D,E,F]),write('|'),nl,	write('|'),
        write([G,H,I]),write('|'),nl,nl.

main :- inicio, iniciar([a,a,a,a,a,a,a,a,a]).

inicio :-
  write('Voce joga com x, digite a posicao que quer jogar.'),
  nl,
  disp([1,2,3,4,5,6,7,8,9]).

iniciar(L) :- vitoria(L, x), write('Venceu!').
iniciar(L) :- vitoria(L, o), write('Perdeu!').
iniciar(L) :- not(member(a,L)), write('Empatou!').
iniciar(L) :- read(N),
  moverJ(L, N, NL),
  disp(NL),
  oplay(NL, NnL),
  disp(NnL),
  iniciar(NnL).

venceJ(L) :- moverIA(L, x, NL), vitoria(NL, x).

oplay(L,NL) :-
  moverIA(L, o, NL),
  vitoria(NL, o),!.
oplay(L,NL) :-
  moverIA(L, o, NL),
  not(venceJ(NL)).
oplay(L,NL) :-
  moverIA(L, o, NL).
oplay(L,NL) :-
  not(member(a,L)),
  NL = L.
