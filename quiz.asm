.globl main
#Purpose: To make a quiz using subroutines that prompts three questions
#and each question having four possible responses
#Each answer has a certain amount of points attributed to it and at the end of 
#the program these points are tallied in order to print the correct response
#Program then loops back around to start 
.text
main:
	and s1, s1, zero	#s2 is used to store the total points
	
	la a1, Q1
	jal getInteger		#get integer of answer1
	la a1, Q1Answ		
	jal getPoints		#get the score of answer1, stored in a0
	
	add s1, s1, a0		#adds total points
	
	la a1, Q2
	jal getInteger		#get integer of answer2
	la a1, Q2Answ
	jal getPoints		#get the score of answer2, stored in a0
	
	add s1, s1, a0		#adds total points
	
	la a1, Q3
	jal getInteger		#get the integer of answer3
	la a1, Q3Answ
	jal getPoints		#get the score of answer3, stored in a0
	
	add s1, s1, a0		#adds total points
	
	and a0, a0, zero
	add a0, a0 ,s1		#move total points of s1 to a0
	jal printOutput		#process the output
	
	#adds a buffer between quiz calls
	la a0, addBuffer
	jal PrintString
	
	#loop
	b main

.data
addBuffer: .string "\n\n\n"
	
	
	




#subprogram: getInteger
#purpose: prompt the question and return integer value of answer in a0
#input: a1 - memory address of prompt the print
#output: a0 - integer of response
.text
getInteger:
	and t1, t1, zero	#preserve the return address
	mv t1, ra
	
	mv a0, a1	#move memory address of String into a0
	jal PrintString
	
	la a0, answerPrompt	#print out "Answer:"
	jal PrintString
	
	jal ReadInt	#read int prompt, stores in a0
	
	
	mv ra, t1	#return the ra register
	jr ra		#return

.data
answerPrompt: .string "Answer: "



#subprogram: getPoints
#purpose: take an integer value and return the points associated
#input: a0 - the integer value
#	a1- the first spot of memory of associated points
#output: a0 - points for the answer
.text
getPoints:
	mv t1, a0	#move the integer value to t1
	and t2, t2, zero	#clear value of t2
	addi t2, t2, 4	#add 4 to register t2
	mul t1, t1, t2  #multiply t1 by 4, offsets the register to the correct value
	addi t1, t1, -4 #offsets back so that first position will be position zero
	
	add a1, a1, t1	#chooses the correct spot in memory
	lw a0, (a1)	#loads the amount of points awarded into a0
	jr ra



.text
#Subprogam: print the result
#input: a0 - the total points
#output: prints to console
#The program branches out to which prompt to print by comparing the 
#score by halving once and then halving again to see the ranges in which it falls
printOutput:
	
	and t5, t5, zero #save the ra in t5 to use at the end
	mv t5, ra
	
	#check one
	and t2, t2, zero
	addi t2, t2, 15
	
	#check two, upper side
	and t4, t4, zero
	addi t4, t4, 25
	
	#check two, lower side
	and t3, t3, zero
	addi t3, t3, 9
	
	#if score is above 15, branch to the upperside check
	bgt a0, t2, upperSideCheck
	#score is below 15, branch to the lower side check
	b lowerSideCheck
	
	#branches scores above 15
	upperSideCheck:
		#if score is above 25, print4
		bgt a0, t4, print4
		#score is above 15 but below 25, print 3
		b print3
		
	#branches scores below 15
	lowerSideCheck:
		#if score is above 9, print 2
		bgt a0, t3, print2
		#score is below 9, print 1
		b print1
	
	#print result 4 - highest
	print4:
		la a0, Result4
		jal PrintString
		b endSub
	#print result 3 - second highest
	print3:
		la a0, Result3
		jal PrintString
		b endSub
	#print result 2 - third highest
	print2:
		la a0, Result2
		jal PrintString
		b endSub
	#print result 1 - the lowest score
	print1:
		la a0, Result1
		jal PrintString
		b endSub
	#ends the subprogram
	endSub:
		mv ra, t5	#return the ra from t5 to x1
		jr ra



	


