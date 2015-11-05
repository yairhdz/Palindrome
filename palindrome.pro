texto([]).

main:- write('Escribe una frase: '),
		 read_string(E),
		 string_term(S,E),
		 particiona(S).
		 
particiona(T):- sub_string(T,Pos_Ini,1,$ $),
					Long_1 is Pos_Ini-1,
					sub_string(T,1,Long_1,T1),
					dividirchar(T1,Long_1),
					texto(Lista),
					write('Elemento separado:'),
					write(T1),nl,
					string_length(T,Largo),
					Long_2 is Largo-Pos_Ini,
					Pos_2 is Pos_Ini+1,
					sub_string(T,Pos_2,Long_2,T2),
					particiona(T2).
					
particiona(T):-texto(Lista),
					write('Ultimo elemento:'),
					write(T),nl,
					string_length(T,Largo),
					dividirchar(T,Largo),
					palin(Lista).
					

member(X,[X|L]) :- !.
member(X,[X|L]) :- member(X,L).
add(X,L,L) :- member(X,L), !.
add(X,L,[X|L]).

dividirchar(T,Largo) :- Avance is 1,
									incremento(Avance,T,Largo).

incremento(Avance,T,Largo) :-	texto(Lista),
									(
									Avance =< Largo 
									-> sub_string(T,Avance,1,Ch1),
										add(Ch1,Lista,Lista2),
										retract(texto(Lista)),
				   					assert(texto(Lista2)),
										Avance1 is Avance + 1,
										incremento(Avance1,T,Largo)
									;  palin(Lista)
									).

 palin(List1):-
        findrev(List1,[],List2),
        compare(List1,List2).
 findrev([],List1,List1).
    
 findrev([X|Tail],List1,List2):-
        findrev(Tail,[X|List1],List2).
        
 compare([],[]):-
        write("la frase es Palindrome").
        
 compare([X|List1],[X|List2]):-
        compare(List1,List2).    
        
 compare([X|List1],[Y|List2]):-
        write("la frase no es Palindrome").           
