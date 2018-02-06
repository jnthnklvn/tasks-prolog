%% Relacoes de comida independem da ordem da tupla
come(ovelha,alface).
come(alface,ovelha).
come(lobo,ovelha).
come(ovelha,lobo).

%% Se a ovelha estah no lado1 com 2 acompanhantes, levamos ela.
atravessa([ovelha,Y,Z], _, [Y,Z], [ovelha], S, [ovelha|S]).
atravessa([X,ovelha,Z], _, [X,Z], [ovelha], S, [ovelha|S]).
atravessa([X,Y,ovelha], _, [X,Y], [ovelha], S, [ovelha|S]).
%% Se a ovelha estah no lado2 com 1 acompanhante, trazemos ela.
atravessa([X], [Y,ovelha], [X,ovelha], [Y], S, [ovelha|S]).
atravessa([X], [ovelha,Z], [X,ovelha], [Z], S, [ovelha|S]).
%% Se a ovelha estah no lado1 com 1 acompanhante, levamos ele.
atravessa([X,ovelha], [Z], [ovelha], [X,Z], S, [X|S]).
atravessa([ovelha,Y], [Z], [ovelha], [Y,Z], S, [Y|S]).
%% Se soh a ovelha estah no lado2, levamos qualquer um.
atravessa([X,Y], [ovelha], [Y], [X,ovelha], S, [X|S]).
atravessa([X,Y], [ovelha], [X], [Y,ovelha], S, [Y|S]).
%% Se só sobrou a ovelha no lado1, levamos ela.
atravessa([ovelha], [Y,Z], [], [ovelha,Y,Z], S, [ovelha|S]).
%% A solucao eh encontrada quando o lado1 estah vazio

solucao([],_,S,S).
solucao(Lado1, Lado2, S, NSolucao) :- 
	atravessa(Lado1, Lado2, NLado1, NLado2, S, Solucao),
	solucao(NLado1, NLado2, Solucao, NSolucao).
% Query: solucao([alface,ovelha,lobo], [], [], Solucao).
