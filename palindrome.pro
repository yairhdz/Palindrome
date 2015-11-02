texto([]).
textoOrden([]).

main:- write('Escribe una frase: '),
		 read_string(E),
		 string_term(S,E),
		 particiona(S).
		 
particiona(T):- sub_string(T,Pos_Ini,1,$ $),
					Long_1 is Pos_Ini-1,
					sub_string(T,1,Long_1,T1),
					texto(Lista),
					add(T1, Lista, Lista2),
					retract(texto(Lista)),
				   assert(texto(Lista2)),
					write('Elemento separado:'),
					write(T1),nl,
					string_length(T,Largo),
					Long_2 is Largo-Pos_Ini,
					Pos_2 is Pos_Ini+1,
					sub_string(T,Pos_2,Long_2,T2),
					particiona(T2).
					
particiona(T):-texto(Lista),
					add(T, Lista, Lista2),
					retract(texto(Lista)),
				   assert(texto(Lista2)),
					write('Ultimo elemento:'),
					write(T),nl,
					write(Lista2),
					escribir_lista(Lista2).
					%textoOrden(ListaO),
					%write('>>'),write(ListaO),
					%atomlist_concat([hola, mundo], X),
					%write(X).
					

member(X,[X|L]) :- !.
member(X,[X|L]) :- member(X,L).
add(X,L,L) :- member(X,L), !.
add(X,L,[X|L]).

escribir_lista([]).
escribir_lista([Head|Tail]):- textoOrden(Lista),
										add(Head,Lista,Lista2),
										retract(textoOrden(Lista)),
				   					assert(textoOrden(Lista2)),nl,
										write('>>'),write(Lista2), nl,
										atomlist_concat(Lista2,X),
										write(X),
									   escribir_lista(Tail).
							  

		
		palin(List1):-
        findrev(List1,[],List2),
        compare(List1,List2).
            
    findrev([],List1,List1).
    
    findrev([X|Tail],List1,List2):-
        findrev(Tail,[X|List1],List2).
        
    compare([],[]):-
        write("\nList is Palindrome").
        
    compare([X|List1],[X|List2]):-
        compare(List1,List2).    
        
    compare([X|List1],[Y|List2]):-
        write("\nList is not Palindrome").