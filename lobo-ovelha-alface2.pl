come([ovelha,alface]).
come([alface,ovelha]).
come([lobo,ovelha]).
come([ovelha,lobo]).

atravessa([X,Y,Z], [], [Y,Z], [X]).
atravessa([X,Y,Z], [], [X,Z], [Y]).
atravessa([X,Y,Z], [], [Y,X], [Z]).
atravessa([X,Y], [Z], [Y], [X,Z]).
atravessa([X,Y], [Z], [X], [Y,Z]).
atravessa([X], [Y,Z], [], [X,Y,Z]).

solucao([],_).
%%solucao([E1],L2):- ((not(come(L2)), atravessa([E1], L2, L1, NL2));
%%  (come(L2), atravessa(L2, [E1], NL2, L1), come(L1))), solucao(L1,NL2), write(NL2).

solucao([E1],L2):- atravessa([E1], L2, L1, NL2),
  solucao(L1,NL2), write(NL2).

solucao(L1,[E3]):- atravessa(L1, [E3], NL1, NL2), not(come(NL2)),
  solucao(NL1,NL2), write(NL2).

%%solucao(L1,[E3]):- ((atravessa(L1, [E3], NL1, NL2), not(come(NL2)));
%%  (not(come(L1)), atravessa(L1, [E3], NL1, NL2))), solucao(NL1,NL2), write(NL2).

solucao(L1,[]):- atravessa(L1, [], NL1, NL2), not(come(NL1)),
  solucao(NL1,NL2), write(NL2).

%% solucao([ovelha,alface,lobo],[]).
