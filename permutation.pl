%helper function, because otherwise we will get all subsets and its permutations 
permut([],[]).
permut([H|T],L):- permut(T,L1),sel(H,L,L1).

sel(X,[X|T],T).
sel(X,[Y|T],[Y|T2]):- sel(X,T,T2).

%fill_one_to_nine(L):- permut([1,2,3,4,5,6,7,8,9],L).

fill_one_to_nine(L):-
	find_nonvars(L,NVars), find_vars(NVars,Vars),!,permut(Vars,M), fill_one_to_nine(L,M).

fill_one_to_nine(_,[]):- !.
fill_one_to_nine([A|T],M):- nonvar(A), fill_one_to_nine(T,M).
fill_one_to_nine([X|T],[X|T2]):- fill_one_to_nine(T,T2).

find_nonvars([],[]).
find_nonvars([A|T],[A|T2]):- nonvar(A),find_nonvars(T,T2),!.
find_nonvars([A|T],T2):- var(A),find_nonvars(T,T2).

find_vars(L,M):-
	find_vars(L,[1,2,3,4,5,6,7,8,9],M),!.
find_vars([],L,L).
find_vars([X|T],L,Vars):-
	sel(X,L,M), find_vars(T,M,Vars).