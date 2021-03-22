
.data
#Question prompts for the quiz
.globl Q1 Q2 Q3

Q1:	.string  "What is the best Star Wars Character?\n   -1: Obi-wan Kenobi\n   -2 Anakin Skywalker/Darth Vader\n   -3 Luke Skywalker\n   -4 Jar Jar Binks\n"
Q2: 	.string  "What is the best movie in Star Wars?\n   -1: Episode 1\n   -2: Episode 5\n   -3: Episode 3\n   -4: Rogue One\n"
Q3: 	.string  "What is the best starfighter in Star Wars?\n   -1: Red Five X-Wing\n   -2: TIE Fighter\n   -3: ARC-170\n   -4: B-Wing\n"


#Amount of points per answer 
.globl Q1Answ Q2Answ Q3Answ
Q1Answ: .word	10	#Obi-Wan
	.word	8	#Anakin
	.word	5	#Luke
	.word	0	#Jar Jar
	
Q2Answ: .word	2	#Episode 1
	.word	6	#Episode 5
	.word	10	#Episdoe 3
	.word	4	#Rogue One
	
Q3Answ: .word	10	#Red Five
	.word	2	#Tie Fighter
	.word	7	#ARC 170
	.word	5	#B Wing
	
	
	
#Result prompts
.globl Result1 Result2 Result3 Result4

Result1: .string "\nResult: I find your lack of faith disturbing"
Result2: .string "\nResult: Storm Troopers have better aim than you"
Result3: .string "\nResult: This is where the fun begins"
Result4: .string "\nResult: You will bring balance to the Force"

		

