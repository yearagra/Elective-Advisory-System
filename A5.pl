output:-
	nl,
        advice(_),
	preferences(List),nl,

	(isempty(List)
		->write('No Electives For You. Sorry!!' ),nl
		;write('Electives For You Are: '),show(List)),
		nl,

	retractall(recommend(_)),
	retractall(cse1(_)),
	retractall(ece1(_)),
	retractall(csam1(_)),
	retractall(csd1(_)),
        clear.

getoutput:-
  open('/E:/Project/MAUI/PythonApplication1/PythonApplication1/input.txt', read, Str),
  read_file(Str,Lines),
  close(Str),
  facts(Lines).

% reading the facts converting them for the program interpretation.
facts([Head|Tail]):-
		((Head == end_of_file)
			->facts(Tail)
			;assert(Head), facts(Tail)
			).
facts([]).




/* CSE Course */
advice('Mobile Computing') :- mc,fail.
advice('Security & Privacy') :- sp,fail.
advice('Computer Systems Architecture') :- csa,fail.
advice('Intelligence Theory') :- ilt,fail.
advice('Data Analytics') :- da,fail.
advice('Image Analysis & Machine Learning') :- iaml,fail.

/*ECE Course */
advice('Communication Systems') :- cs,fail.
advice('Signal Processing') :- sgp,fail.
advice('Hardware') :- hw,fail.
advice('Internet of Things') :- it,fail.
advice('Economics') :- eco,fail.
advice('Image Analysis & Machine Learning') :- iml,fail.

/* CSAM Course */
advice('Number Theory ') :- nt,fail.
advice('Advanced Programming ') :- ap,fail.
advice('Signals and Systems') :- ss,fail.
advice('Numerical Methods') :- nm,fail.

/* CSD Course */
advice('Computer Graphics') :- cg,fail.
advice('Data Visualisation') :- dv,fail.
advice('Image Processing') :- ip,fail.
advice('Computer Vision') :- cv,fail.
advice('Machine Learning') :- ml,fail.
advice('Affective Computing') :- ac,fail.
advice('Computer Game Design And Development') :- cgdd,fail.
advice('Animation Priciples And Design') :- apd,fail.
advice('Virtaul Reality') :- vr,fail.


advice('SORRY, NO RECOMMENDATION!').


preferences([Head|Tail]):- retract(recommend(Head)), preferences(Tail).
preferences([]).

show([Head|Tail]):-
	format('~n ~w',[Head]),show(Tail).

show([]).
isempty([]).

/* CSE */
mc :-
	retract(cse1(A)),
	print(A),nl,
	assert(cse1(A)),
	(A == yes
		->true ;fail),
	questioninterest('java'),
	questioninterest('programming'),
	questioninterest('handonproject'),
	assert(recommend('Mobile Computing')).

sp :-
	retract(cse1(A)),
	assert(cse1(A)),
	(A == yes
		->true ;fail),
	questioninterest('python'),
	questioninterest('goodprogramming'),
	questioninterest('handonproject'),
        assert(recommend('Security & Privacy')).

csa :-
	retract(cse1(A)),
	assert(cse1(A)),
        (A == yes
		->true ;fail),
	questioninterest('programming'),
	assert(recommend('Computer Systems Architecture ')).


ilt :-
		retract(cse1(A)),
		assert(cse1(A)),

		(A == yes
			->true ;fail),
		questioninterest('programming'),
		assert(recommend('Intelligence Theory')).

da :-
	retract(cse1(A)),
	assert(cse1(A)),
	( A == yes
		->true ;fail),
	questioninterest('programming'),
	questioninterest('math'),
	assert(recommend('Data Analytics')).

iaml :-
	retract(cse1(A)),
	assert(cse1(A)),
	(A == yes
		->true ;fail),

	questioninterest('python'),
	questioninterest('math'),
	assert(recommend('Image Analysis & Machine Learning')).

/* ECE */
cs :-
	retract(ece1(B)),
	assert(ece1(B)),
	(B == yes
		->true ;fail),

	questioninterest('math'),
	assert(recommend('Communication System')).




sgp :-
	retract(ece1(B)),
	assert(ece1(B)),
	(B == yes
		->true ;fail),

	questioninterest('math '),
	assert(recommend('Signal Processing')).


hw :-
	retract(ece1(B)),
	assert(ece1(B)),
	(B == yes
		->true ;fail),
	questioninterest('hardwareofpc'),
	assert(recommend('Hardware')).

it :-
	retract(ece1(B)),
	assert(ece1(B)),

	(B == yes
		->true;fail),

	questioninterest('python'),
	questioninterest('network'),
	assert(recommend('Internet of Things')).

eco :-
	retract(ece1(B)),
	assert(ece1(B)),
	( B == yes
		->true;fail),

	questioninterest('economics'),
	assert(recommend('Economics')).

iml :-
	retract(ece1(B)),
	assert(ece1(B)),
	(B == yes
		->true ;fail),

	questioninterest('python'),
	questioninterest('math'),
	assert(recommend('Image Analysis & Machine Learning')).

/* CSAM */
nt :-
	retract(csam1(C)),
	assert(csam1(C)),
	(C == yes
		->true;fail),
	questioninterest('math'),
	questioninterest('programming'),
	assert(recommend('Number Theory')).

ap :-
	retract(csam1(C)),
	assert(csam1(C)),
	(C == yes
		->true;fail),
	questioninterest('java'),
	questioninterest('goodprogramming'),
	questioninterest('handonproject'),
        assert(recommend('Advanced Programming')).

ss :-
	retract(csam1(C)),
	assert(csam1(C)),
        (C == yes
		->true;fail),
	questioninterest('math'),
	questioninterest('programming'),
	questioninterest('handonproject'),
	assert(recommend('Signals and Systems')).


nm :-
	retract(csam1(C)),
	assert(csam1(C)),

	(C == yes
		->true;fail),
	questioninterest('math'),
	questioninterest('programming'),
	assert(recommend('Numerical Methods')).

/* CSD */
cg :-
	retract(csd1(D)),
	assert(csd1(D)),
	( D == yes
		->true;fail),
	questioninterest('programming'),
	questioninterest('dsa'),
	assert(recommend('Computer Graphics')).

dv :-
	retract(csd1(D)),
	assert(csd1(D)),
	(D == yes
		->true;fail),
	questioninterest('uiux'),
	questioninterest('programming'),
	assert(recommend('Data Visualisation')).

ip :-
	retract(csd1(D)),
	assert(csd1(D)),
	( D == yes
		->true;fail),
	questioninterest('python'),
	questioninterest('programming'),
	assert(recommend('Image Processing')).

cv :-
	retract(csd1(D)),
	assert(csd1(D)),
	(D == yes
		->true;fail),
	questioninterest('python'),
	questioninterest('programming'),
	assert(recommend('Computer Vision')).

ml :-
	retract(csd1(D)),
	assert(csd1(D)),
	( D == yes
		->true;fail),
	questioninterest('python'),
	questioninterest('programming'),
	questioninterest('math'),
	assert(recommend('Machine Learning')).

ac :-
	retract(csd1(D)),
	assert(csd1(D)),
	(D == yes
		->true;fail),

	questioninterest('programming'),
	questioninterest('math'),
	assert(recommend('Affective Computing ')).

cgdd :-
	retract(csd1(D)),
	assert(csd1(D)),
	(D == yes
		->true;fail),

	questioninterest('uiux'),
	questioninterest('programming'),
	assert(recommend('Computer Game Design And Development ')).

apd :-
	retract(csd1(D)),
	assert(csd1(D)),
	( D == yes
		->true;fail),
	questioninterest('animation'),
	questioninterest('programming'),
	assert(recommend('Animation Priciples And Design')).

vr :-
	retract(csd1(D)),
	assert(csd1(D)),
	(D == yes
		->true;fail),
	questioninterest('programming'),
	questioninterest('machinelearning'),
	assert(recommend('Virtaul Reality')).



questioninterest(In) :-
	(yes(In)
		->true
		;(no(In)
			->fail
			;ask(In))).

ask(Que) :-
	format('~w ?',[Que]),
	read(Ans),
	( (Ans == yes ; Ans == y)
		->assert(yes(Que))
		;assert(no(Que)), fail).

:- dynamic yes/1,no/1.


clear :- retract(yes(_)),fail.
clear :- retract(no(_)),fail.
clear.


read_file(Stream,[]) :-
  at_end_of_stream(Stream).
read_file(Stream,[X|L]) :-
  \+ at_end_of_stream(Stream),
  read(Stream,X),
  read_file(Stream,L).


