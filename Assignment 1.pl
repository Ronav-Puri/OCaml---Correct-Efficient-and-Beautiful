/* member() */
mem(X, [X|_]) :- !.
mem(X, [_|L]) :- mem(X, L).

/* interI(S1, S2, S3) = S3 is the intersection of S1 and S2 */
interI([], _, []) :- !.
interI([X|L1], S2, [X|L2]) :- mem(X, S2), interI(R, S2, L2).
interI([_|L1], S2, L2) :- interI(L1, S2, L2).

/*Test Cases: 
?- interI([], [1, 2, 3], []).
?- interI([1, 2, 3], [], []).
?- interI([1, 2, 3], [4, 5, 6], []).
?- interI([1, 3, 5], [2, 3, 5], [3, 5]).
?- interI([0, 2, 4], [0, 2, 4], [0, 2, 4]).*/

/* diffI(S1, S2, S3) = S3 is the set difference of S1 and S2 */
diffI([], _, []) :- !.
diffI([L1|R], S2, [X|L2]) :- \+ mem(L1, S2), diffI(R, S2, L2).
diffI([_|L1], S2, L2) :- diffI(L1, S2, L2).

/* Test Cases:
?- diffI([], [1, 2, 3], []).\
?- diffI([1, 2, 3], [], [1, 2, 3]).
?- diffI([1, 2, 3], [4, 5, 6], [1, 2, 3]).
?- diffI([1, 2, 3], [2, 3, 4], [1]).*/

/* CartesiaI(S1, S2, S3) = S3 is the cartesian product of S1 and S2 */
cartesian_product_with_element(_, [], []) :- !.
cartesian_product_with_element(X, [Y|L1], [[X,Y]|L2]) :- cartesian_product_with_element(X, L1, L2).

cartesianI([], _, []) :- !.
cartesianI([X|L], S2, S3) :- cartesian_product_with_element(X, S2, Pairs), cartesianI(L, S2, RestPairs), append(Pairs, RestPairs, S3).

/* Test Cases:
?- cartesianI([], [1, 2, 3], []).
?- cartesianI([1, 2, 3], [], []).
?- cartesianI([1, 2], [0, 5], [[1, 0], [1, 5], [2, 0], [2, 5]]).
?- cartesianI([1], [2], [[1, 2]]).
?- cartesianI([1, 2, 3], [4, 5], [[1, 4], [1, 5], [2, 4], [2, 5], [3, 4], [3, 5]])*/
