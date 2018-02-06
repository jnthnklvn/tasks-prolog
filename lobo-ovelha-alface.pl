come(ovelha,alface).
come(alface,ovelha).
come(lobo,ovelha).
come(ovelha,lobo).

atravessa([X,Y,Z], [], [Y,Z], [X], S, [X|S]):- come(Y,X), come(Z,X).
atravessa([X,Y,Z], [], [X,Z], [Y], S, [Y|S]):- come(X,Y), come(Z,Y).
atravessa([X,Y,Z], [], [X,Y], [Z], S, [Z|S]):- come(Y,Z), come(X,Z).
atravessa([X,Y], [Z], [Y], [X,Z], S, [X|S]):- not(come(X,Z)).
atravessa([X,Y], [Z], [X], [Y,Z], S, [Y|S]):- not(come(Y,Z)).
atravessa([X,Y], [Z], [Y], [X,Z], S, [X|S]):- come(X,Z),come(Y,Z).
atravessa([X,Y], [Z], [X], [Y,Z], S, [Y|S]):- come(Y,Z),come(X,Z).
atravessa([X], [Y,Z], [], [X,Y,Z], S, [X|S]):- not(come(Y,Z)).
atravessa([X], [Y,Z], [X,Z], [Y], S, [Z|S]):- come(Y,Z), come(Z,X).
atravessa([X], [Y,Z], [X,Y], [Z], S, [Y|S]):- come(Y,Z), come(Y,X).

solucao([],_,S,S).
solucao(Lado1, Lado2, S, NSolucao) :- 
	atravessa(Lado1, Lado2, NLado1, NLado2, S, Solucao),
	solucao(NLado1, NLado2, Solucao, NSolucao).
% Query: solucao([alface,ovelha,lobo], [], [], Solucao).
