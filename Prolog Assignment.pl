/*Frederic Marchand*/
/*100817579*/
/*Question 1*/

/*Defining dictionary*/
male(manish).
male(hitesh).
male(dhiraj).
male(kashiram).
male(ram).
male(raju).
male(deepak).
male(garv).
male(neel).
male(dhruv).
male(fulra).
male(shaurya).



female(shreya).
female(bai).
female(rachna).
female(pinki).
female(prem).
female(sejal).
female(kumari).






parent(raju,dhruv). 
parent(rachna,dhruv). 
parent(rachna,shaurya). 
parent(raju,shaurya). 
parent(kashiram, raju).
parent(bai, raju).
parent(prem, rachna).
parent(ram, rachna).

parent(manish, fulra).
parent(shreya, fulra).
parent(ram, manish).
parent(prem, manish).

parent(deepak, garv).
parent(pinki, garv).
parent(ram, pinki).
parent(prem, pinki).

parent(dhiraj, sejal).
parent(kumari, sejal).
parent(dhiraj, neel).
parent(kumari, neel).
parent(prem, dhiraj).
parent(ram, dhiraj).
parent(prem, hitesh).
parent(ram, hitesh).

father(X, Y) :- male(X), parent(X, Y). /* X is the father of Y */
mother(X, Y) :- female(X), parent(X, Y). /* X is the mother of Y */

difference(X,Y) :- X \== Y. /* X and Y are different */

/* X is married to Y */
married(ram, prem).
married(kashiram, bai).
married(raju, rachna).
married(deepak, pinki).
married(manish, shreya).
married(dhiraj, kumari).
husband(X,Y) :- male(X), married(X,Y). /* X is husband of Y */
wife(X,Y) :- female(X), married(Y,X). /* X is wife of Y */

is_mother(X) :- mother(X, _). /* X is a mother */
is_father(X) :- father(X, _). /* X is a father */


/* X is an aunt of Y */
aunt(X, Y) :- female(X), sibling(X, Z), parent(Z, Y).
aunt(X, Y) :- female(X), wife(X, W), sibling(W, Z), parent(Z, Y).


/* X is an uncle of Y */
uncle(X, Y) :- male(X), sibling(X, Z), parent(Z, Y).
uncle(X, Y) :- male(X), husband(X, W), sibling(W, Z), parent(Z, Y).


/* X is a sister of Y */
sister_of(X,Y) :- female(X), father(F, X), father(F, Y),
					mother(M, X), mother(M,Y), difference(X, Y).

/* X is a brother of Y */
brother_of(X,Y) :- male(X), father(F, X), father(F, Y),
					mother(M, X), mother(M,Y), difference(X, Y).


grandfather_of(X,Y) :- father(X,Z), parent(Z,Y). /* X is a grandfather of Y */
grandmother_of(X,Y) :- mother(X,Z), parent(Z,Y). /* X is a grandmother of Y */

grandchild(X,Y) :- grandfather_of(Y,X); grandmother_of(Y,X). /* X is a grandchild of Y */

sibling(X,Y) :- father(P,X), father(P,Y), mother(M, X), mother(M,Y), difference(X, Y). /* X is a sibling of Y, i.e they have the same parents */


						


related(X, Y) :- ancestor(Z, X) , ancestor(Z, Y), difference(X, Y). /*X and Y have a common ancestor*/

/* X is an ancestor of Y */
ancestor(X, Y) :- parent(X, Y). 
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

descendent(X, Y) :- ancestor(Y, X). /* X is a descendent of Y */

