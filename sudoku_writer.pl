write_sudoku(L):-
	write_row(L,L1), 
	write_row(L1,L2),
	write_row(L2,L3),
	write('- - - + - - - + - - -'),nl,
	write_row(L3,L4),
	write_row(L4,L5),
	write_row(L5,L6),
	write('- - - + - - - + - - -'),nl,
	write_row(L6,L7),
	write_row(L7,L8),
	write_row(L8,[]),nl.
	
write_row([A,B,C,D,E,F,G,H,I|T],T):-
	format('~d ~d ~d | ~d ~d ~d | ~d ~d ~d',[A,B,C,D,E,F,G,H,I]),nl.