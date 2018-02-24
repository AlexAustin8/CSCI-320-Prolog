%Problem 1: Given the Following Rules:

pretty(X):-artwork(X).
pretty(X):-color(X,red), flower(X).
watchout(X):-sharp(X,Y).
flower(rose).
flower(violet).
color(rose,red).
sharp(rose,stem).
sharp(holly,leaf).

%Give the sequence of search actions that prolog would perform for the query ?-pretty(X).
  
%    Goal: pretty(X)
%    Match: pretty(X)
%    Goal: artwork(X)
%    Fail: artwork(X)
%    Redo: pretty(X).
%    Match: pretty(X).
%    Goal: color(X,red)
%    Match color(rose,red) with X = rose.
%    Goal: flower(X) with X = rose
%    Match: flower(X) with X = rose
%    Match: pretty(X) with X = rose.
%
%    true with X = rose.






%Problem 2: Define The Fibonacci Sequence in Prolog using fib(N,FN), where N
%is a positive integer and FN represents the Nth fibonacci number


fib(0,0).
fib(0,1).
fib(1,1).
fib(X,Y) :- X1 is X-1, X2 is X-2, fib(X1, Y1), fib(X2, Y2), Y is Y1 + Y2.


%Problem 3
%Implement The Ackermann Function in Prolog using ack(X,Y,A), Where X and Y are integers
% and A represents the Ackermann Value for a given x and y.

ack(0,Y,A) :- A is Y + 1.
ack(1,Y,A) :- A is Y + 2.
ack(2,Y,A) :- A is (2*Y) + 3.
ack(3,Y,A) :- P is Y + 3, pow(2,P,ANS), A is ANS - 3.
ack(X,0,A) :- X1 is X-1, ack(X1,1,ANS), A is ANS.
ack(X,Y,A) :- X1 is X-1, Y1 is Y-1, ack(X,Y1, ANS1), ack (X1, ANS1, A) A is ANS

pow(X,1,A) :- A is X.
pow(X,Y,A) :- Y1 is Y-1, pow(X,Y1,A2), A is X*A2.
