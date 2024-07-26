hastype(_, N, intT) :- integer(N).
hastype(_, T, boolT) :- T == true.
hastype(_, F, boolT) :- F == false.

/*Arithmetic Operations*/
hastype(G, E1+E2, intT) :- hastype(G, E1, intT), hastype(G, E2, intT).
hastype(G, E1-E2, intT) :- hastype(G, E1, intT), hastype(G, E2, intT).
hastype(G, E1*E2, intT) :- hastype(G, E1, intT), hastype(G, E2, intT).
hastype(G, E1/E2, intT) :- hastype(G, E1, intT), hastype(G, E2, intT).
hastype(G, E1 % E2, intT) :- hastype(G, E1, intT), hastype(G, E2, intT).

/*Boolean Operations*/
hastype(G, E1∧E2, boolT) :- hastype(G, E1, boolT), hastype(G, E2, boolT).
hastype(G, E1∨E2, boolT) :- hastype(G, E1, boolT), hastype(G, E2, boolT).
hastype(G, ¬E, boolT) :- hastype(G, E, boolT).

/*Comparision Operators*/
hastype(G, E1=E2, boolT) :- hastype(G, E1, X), hastype(G, E2, X).
hastype(G, E1!=E2, boolT) :- hastype(G, E1, X), hastype(G, E2, X).
hastype(G, E1>E2, boolT) :- hastype(G, E1, intT), hastype(G, E2, intT).
hastype(G, E1<E2, boolT) :- hastype(G, E1, intT), hastype(G, E2, intT).
hastype(G, E1>=E2, boolT) :- hastype(G, E1, intT), hastype(G, E2, intT).
hastype(G, E1<=E2, boolT) :- hastype(G, E1, intT), hastype(G, E2, intT).