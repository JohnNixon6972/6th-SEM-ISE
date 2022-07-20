% ---------------------------------------------------------------------------------------------------------
% Permuatation      input = perm([a,b,c,d],X).
perm(List,[H|Perm]):-delete(H,List,Rest),perm(Rest,Perm).
perm([],[]).
   
delete(X,[X|T],T).
delete(X,[H|T],[H|NT]):-delete(X,T,NT).

% ---------------------------------------------------------------------------------------------------------
% Memeber       input = list_member(b,[a,b,c]).
list_member(X,[X|_]).
list_member(X,[_|TAIL]) :- list_member(X,TAIL).

% ---------------------------------------------------------------------------------------------------------
% Concatenation         input = list_concat([1,2],[a,b,c],NewList).
list_concat([],L,L).
list_concat([X1|L1],L2,[X1|L3]) :- list_concat(L1,L2,L3).
