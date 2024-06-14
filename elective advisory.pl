
%main function to start the execution of the prolog program.

%from pl file
%xname- done
%prerequsites done
%minor_choice # done
%xyear -done
%mybranch - done


start:-
    consult(sample_file_prolog),
    suggest.

suggest:-

		write("WELCOME TO ELECTIVE GENIUS "),nl,
		write("May I know your name"),nl,
		xname(Myname),nl,					 %xname
		write("Hi! "), write(Myname), write(" I have heard you need to choose electives for your college"),nl,
		write("Which year are you in"), nl,
		xyear(Myear),nl,					%xyear
		write(Myear),nl,
		write("Which stream are you enrolled in"),nl,
		write("1). CSE		2). CSAM	3). CSAI	4) CSSS "),nl,
		write("5). CSD		6). CSB		7). ECE"),nl,
		mybranch(Ap),nl,
		write("Which stream are you enrolled in"),nl,
		write("1). CSE		2). CSAM	3). CSAI	4) CSSS "),nl,
		write("5). CSD		6). CSB		7). ECE"),nl,
		write("Enter as CSE./ CSD."),nl,
		mybranchname(Branchname2),nl, %mybranch
		write(Branchname2),nl,
                assert(branch(Branchname2)),nl,
		write("According to your branch which course have you taken already- "),nl,
		print(Ap),nl,
		getpreq(Ap),nl,
		write("You wish to pursue minor in future 1. for yes and 0. for no"),nl,
		minor_choice_want(N),
		print(N),nl,
		minor_choice(N),
		write("Which would be your career preference- "),nl,
		write("1). Job in Engineering domain "),nl,
		write("2). Research profile"),nl,
		write("3). Entrepreneurship"),nl,
		career_preference(S),nl,
		print(S),nl,
		getCareerChoice(S),nl,
		write(Branchname2).



minor_choice(N):- %minor_choice

		write(N),nl,
		(N==1 ->(write("In which field do you want to attain a minor- 1)entrepreneurship,2)Computational-Biology,3)economics"),nl, chooseSub(Choose), print(Choose),nl,choose_sub(Choose));write("Okay"),nl),
		nl. %chooseSub








%flattening the lists to 1D list.

to_1D(H, T) :- to_1D(H,T, []).
to_1D([], F, F) :- !.
to_1D([HH|TT], F, CP) :- !, to_1D(HH, F,XZ), to_1D(TT, XZ, CP).
to_1D(H1, [H1|CP], CP).

%finding the intersection of two lists.

findintersect([], _, []).
findintersect([H|Tail1], Last2, Last3) :- member(H, Last2), !, Last3 = [H|Tail3], findintersect(Tail1, Last2, Tail3).

findintersect([_|Tail1], Last2, Last3) :- findintersect(Tail1, Last2, Last3).


%when inputs for career in the engineering job domains
getCareerChoice(S):- S==1, write("We would recoommend some courses which you should do for your interview preparations for jobs"),nl,
    write("Pre-reqs for the interview courses are, please enter in form of list"),nl,course_elective('job',Course,Elecp), printlist(['DSA','IP','AP','DBMS','OS','ADA']),nl,
pre_requisites(Choice1), nl,nl,			%prerequsites
print(Choice1),nl,
		eligible1(job, Choice1, Elegg1),nl,nl,
		 write("You should go for the following courses:- "), nl,nl, write(Elegg1), nl, nl.



%when inputs for career in the research domains.





getCareerChoice(S):- S==2, write("We would recoommend some courses which you should do for your research interests"),nl,branch(Branchname2),

	write("have you done BTP(y/n) "),nl,
	done_btp(Y),nl,
	(Y == y -> (write("Choose from the following courses"),nl, write(Branchname2),nl,course_elective1(Branchname2,Ans),nl,dict_pairs(Ans,_,H),dict_keys(H,L), write(L),nl, done_btp_course(Coursename),write(Coursename),nl); write("Write [] if not done")),

	course_elective1(Branchname2,Ans),dict_pairs(Ans,_,H),dict_keys(H,L),write(Coursename),nl, write(L),nl, findintersect(L,Coursename,F),nl,
		write("You should choose to do these courses "),nl,
		write(F),nl,
		write("Tell us your current gpa"),nl,
		curr_GPA(G),nl,write(G),nl,
		(G < 7.5 -> (write("YOu have a very low Gpa for doing research, try to increase your GPA")); write("You have a good GPA, still try your best to maintain it"),nl).

%when inputs for career in the entrepreneur domains

getCareerChoice(S):- S==3, write("We would recommend some courses which you should do for your entrepreneurship goals"),nl,
course_elective('Entrepreneur',Co,Electt), write("Course code  "),write('Entrepreneur  '),write(Co),nl,write("Course Pre-reqs are   "),nl,
						printlist(Electt),false.


%sends the elective prerequsites.

coursesnames(Branchname, S):- course_elective1(Branchname, Electives), dict_pairs(Electives,_,P), write(P),nl,pairs_values(P, Qu), write(Qu), nl, to_1D(Qu, Ra), write(Ra), nl.

%for ECE branch outpputs the lsit of prerequsites and tells what all courses the student is eligible for

getpreq(Ap):- Ap==7,nl,write("Pre-reqs for the courses are"),nl,course_elective('ece',Course,Elecp), printlist(['PS','IP','M1','SNS','M3']),nl,course_done(C), nl,nl, print(C),nl,
		write("You are eligible for the following courses "),nl,
		eligible(ece,C, Eleg),nl,nl,
		 write("You are eligible for the following Electives:- "), nl,nl, write(Eleg), nl, nl.


%for CSB branch outpputs the lsit of prerequsites and tells what all courses the student is eligible for

getpreq(Ap):- Ap==6,nl,write("Pre-reqs for the courses are"),nl,course_elective('csb',Course,Elecp), printlist(['IP','M3','PS','M1','LA','ADA','DM']),nl,write("gGGG"),
course_done(C),nl,nl,
		write("You are eligible for the following courses "),nl,
		eligible(csb, C, Eleg),nl,nl,
		 write("You are eligible for the following Electives:- "), nl,nl, write(Eleg), nl, nl.



%for CSD branch outpputs the lsit of prerequsites and tells what all courses the student is eligible for

getpreq(Ap):- Ap==5,nl,write("Pre-reqs for the course are"),nl,course_elective('csd',Course,Elecp), printlist(['IP','M3','PS','M1','DBMS','LA']),nl,

course_done(C), nl,nl,
		write("You are eligible for the following courses "),nl,
		eligible(csd, C, Eleg),nl,nl,
		 write("You are eligible for the following Electives:- "), nl,nl, write(Eleg), nl, nl.


%for CSSS branch outpputs the lsit of prerequsites and tells what all courses the student is eligible for

getpreq(Ap):- Ap==4,nl,write("Pre-reqs for the course are"),nl,course_elective('csss',Course,Elecp), printlist(['DBMS','IoP','ADA','LA','IP','M3','PS','M1']),nl,

course_done(C), nl,nl,
		write("You are eligible for the following courses "),nl,
		eligible(csss, C, Eleg),nl,nl,
		 write("You are eligible for the following Electives:- "), nl,nl, write(Eleg), nl, nl.


%for CSE branch outpputs the lsit of prerequsites and tells what all courses the student is eligible for


getpreq(Ap):- Ap==1,nl,print("GGGGGG"),write("Pre-reqs for the course are"),nl, coursesnames(cse,D),nl,course_done(C), print(C), assert(done(C)), nl,nl,
		write("You are eligible for the following courses "),nl,
		eligible(cse, C, Eleg),nl,nl,

		 write("You are eligible for the following Electives:- "), nl,nl, write(Eleg), nl, nl.


%for CSAM branch outpputs the lsit of prerequsites and tells what all courses the student is eligible for

getpreq(Ap):- Ap==2,nl, coursesnames(csam,D),nl,course_done(C), nl,nl,
		write("You are eligible for the following courses "),nl,
		eligible(csam, C, Eleg),nl,nl,
		 write("You are eligible for the following Electives:- "), nl,nl, write(Eleg), nl, nl.


%for CSAI branch outpputs the lsit of prerequsites and tells what all courses the student is eligible for

getpreq(Ap):- Ap==3, nl,coursesnames(csai,D),nl,course_done(C), nl,nl,
		write("You are eligible for the following courses "),nl,
		eligible(csai, C, Eleg),nl,nl,

		 write("You are eligible for the following Electives:- "), nl,nl, write(Eleg), nl, nl.


%for choosing the prerequsites according to the minor the student wants to done

choose_sub(Z):- Z==1,write("Course you need to do"), nl, printlist(["Microeconomics,NewVenturePlanning,EntrepreneurKhichadi,microeconomics,EntrepreneurCommunication"]).
choose_sub(Z):-	Z==2,write("Mandatory courses "),nl, printlist(['IQB','Any 3 BIO-numbered (3xx to 6xx) course (except FOMB/IP/IS/UR/BTP/BIOX71—BIOX80)']),nl, write('4 credits of IP/IS or 8 credits of BTP').
choose_sub(Z):-	Z==3,write("Mandatory courses in 3x level and above(by code)"),nl,printlist(["eco221", "eco301", "eco311", "eco322", "eco331", "eco332"]).



%checking for courses the student is eligible for.


eligible1(Branchname1, C1, Ans1):- course_elective1(Branchname1, A1), dict_pairs(A1,_,P1), findall(K1,(member(K1-X,P1),subset(X, C1)),Ans1),nl.
eligible(Branchname, C, Ans):- course_elective1(Branchname, A), dict_pairs(A,_,P), findall(K,(member(K-X,P),subset(X, C)),Ans).


% recursive function for printing each element of the list.


printlist([]).
printlist([XP|Elecp]) :-
	write(XP),nl,
	printlist(Elecp).






%knowlegdge base with all the information of the courses and their prerequsites acocording to their branches.


course_elective1(cse,d{'mobile computing':['IP'],'hardware theory':[],'data analytics':['DBMS'],'image analysis & machine learning':['IP','PS','M1','M3']}).


course_elective1(csam,d{'number theory':[],'advanced programming':['DSA','IP'],'scientific computing':['LA'],'graph theory':['LA','DM'],'database management systems':['DSA']}).


course_elective('csd','Computer vision',['LA']).
course_elective('csd','Data mining',['DBMS','IP','M1','PS']).
course_elective('csd','Image processing',['M1','PS']).
course_elective('csd','Computer graphics',['IP']).
course_elective('csd','Machine learning',['IP','M3','PS','M1']).
course_elective('csd','2D and 3D animations',[]).
course_elective('csd','Computer game design and development',[]).

course_elective1(csd,d{'computer vision':['LA'],'2D and 3D animations':[],'computer game design and development':[],'machine learning':['IP','M3','PS','M1'],'computer graphics':['IP'],'data mining':['DBMS','IP','M1','PS'],'image processing':['M1','PS']}).






course_elective('csss','Machine learning',['IP','M3','PS','M1']).
course_elective('csss','Data mining',['DBMS','IP','M1','PS']).
course_elective('csss','Privacy and Security in online social media',[]).
course_elective('csss','social network analysis',['ADA','IP','ps']).
course_elective('csss','Computer vision',['LA']).
course_elective('csss','cognitive psychology',['IoP']).


course_elective1(csss,d{'machine learning':['IP','M3','PS','M1'],'cognitive psychology':['IoP'],'data mining':['DBMS','IP','M1','PS'],'privacy and security in online social media':[],'social network analysis':['ADA','IP','ps'],'computer vision':['LA']}).


course_elective('ece','communication systems',['PS']).
course_elective('ece','signal processing',['SNS']).
course_elective('ece','internet of things',['None']).
course_elective('ece','machine learning',['IP','M3','PS','M1']).

course_elective1(ece,d{'communication systems':['PS'],'signal processing':['SNS'],'internet of things':['None'],'machine learning':['IP','M3','PS','M1']}).


course_elective('csb','Machine learning',['IP','M3','PS','M1']).
course_elective('csb','Computer networks',[]).
course_elective('csb','natural processing language',['PS','ADA','IP']).
course_elective('csb','data science in genomics',[]).
course_elective('csb','Computer vision',['LA']).
course_elective('csb','Big data Analytics',['DBMS']).
course_elective('csb','Cryptography',['DM']).
course_elective('csb','Blockchain and cryptocurrency',[]).


course_elective1(csb,d{'machine learning':['IP','M3','PS','M1'],'computer networks':[],'natural processing language':['PS','ADA','IP'],'data science in genomics':[],'computer vision':['LA'],'big data analytics':['DBMS'],'cryptography':['DM'],'blockchain and cryptocurrency':[]}).

course_elective1(csai,d{'ai in healthcare':[],'human centred ai':[],'computer vision':['LA'],'information retreival':['DSA','AP','DBMS'],'collaborative filtering':['M1'],'robotics':[]}).


course_elective('job','AP',['DSA','IP']).
course_elective('job','ADA',['DSA','IP','AP']).
course_elective('job','OS',['DSA']).
course_elective('job','CN',['OS','ADA','IP']).
course_elective('job','DBMS',['DSA']).
course_elective('job','DSA',['IP']).

course_elective1(job,d{'AP':['DSA','IP'],'ADA':['DSA','IP','AP'],'OS':['DSA'],'CN':['OS','ADA','IP'],'DBMS':['DSA'],'DSA':['IP']}).

course_elective('Entrepreneur','413',['None']).
course_elective('Entrepreneur','414',['None']).
course_elective('Entrepreneur','415',['None']).
course_elective('Entrepreneur','411',['None']).
course_elective('Entrepreneur','412',['None']).
