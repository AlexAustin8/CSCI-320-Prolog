%Problem 1: Write a Prolog program that can be used to find the length of a list
%using the format mylength(List, Len).

mylength([],0).
mylength([H|[]],1). 
mylength([H|T],Len) :-  myLength(T,X2),Len is 1 + X2.


%Problem 2: Write a prolog program that can be used to find the last element of a list
%using the format myLast(List,L), where L is the last element in the list.
%Assume there will be at least one element.

mylast([H|[]],H).
mylast([H|T],L) :- myLast(T,L).

%Problem 3: Write a prolog program that can be used to find the maximum of a list 
%of integers using the format mymax(List,MaxVal), where MaxVal is the max value of the list
%Assume that there will be at least one element.

mymax([],V,V). 
mymax([H|T],V,Max) :- H > V, mymax(T,H,Max).   % V is set to the new H, if it is larger.
mymax([H|T],V,Max) :- mymax(T,V,Max). %Else, V stays the same.
mymax([H|T],Max) :-  mymax(T,H,Max).  %Starts V as a temp varible that store H


%Problem 4: Write a prolog program that can be used to obtain the elements common to 
%2 lists using the format intersect(List1, List2, IntList), where List1 and List2 are
% given lists, and intList is a list of elements common to both

intersect([],_,[]).
intersect([H|T],List2,L):- inList(List2,H), intersect(T,List2,Ltail), L = [H|Ltail]. 
intersect([H|T],List2,L):- intersect(T,List2,L).


%Helper Function to Ddtermine if an element is in a list
inList([H|T],X):- H = X.
inList([H|T],X):- inList(T,X).

%Problem 5: Write a Prolog Program that can be used to obtain the union of two lists using 
%The format union(List1,List2,UnionList), where UnionList contains the Elements of 
%List1 and List2, but no duplicate Elements.

union_aux([],_,[]).
union_aux([H|T],List2,L):- inList(List2,H), union_aux(T,List2,L).
union_aux([H|T],List2,L):- union_aux(T,List2,Ltail), L = [H|Ltail].
union(List1,List2,L):- union_aux(List1,List2,X),removedup(List2,X2), append(X,X2,L).


%Helper Append Function
append([],L,L).
append([H|L1],L2,[H|L3]):- append(L1,L2,L3).

%Helper function to remove duplicates from a single list
removedup([],[]).
removedup([H|T],Res):- inList(T,H),!,removedup(T,Res).
removedup([H|T],[H|T2]):- removedup(T,T2).


%Problem 5: Write a Prolog program mergesort(List, MSorted) that will sort List according
%To  the mergesort algorithm.

mergesort([], []).
mergesort([H], [H]).
mergesort([H1, H2], [H1, H2]) :- H1 =< H2.
mergesort([H1, H2], [H2, H1]) :- H1 > H2.
mergesort(L, R) :- half(L, X1, X2), mergesort(X1, X1sorted), mergesort(X2, X2sorted), merge(X1sorted, X2sorted, R).


%Various Helper functions
split(L, [], L, 0).
split([H|T], [H|T2], X, N) :- N1 is N-1, split(T, T2, X, N1).

half(L, X1, X2) :- length(L, Len), X3 is Len//2, split(L, X1, X2, X3).

merge(X, [], X).
merge([], X, X).
merge([H1|T1], [H2|T2], R) :- H1 =< H2, merge(T1, [H2|T2], M), R = [H1|M].
merge([H1|T1], [H2|T2], R) :- H1 > H2, merge(T2, [H1|T1], M), R = [H2|M].


