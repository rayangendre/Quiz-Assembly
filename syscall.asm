.globl ReadInt

.text
#reads the integer and returns it in a0
ReadInt:
	li a7, 5	#read int prompt, stores in a0
	ecall
	jr ra

.text
.globl PrintString

#reads the string stored in a0 and prints it to console
PrintString:
	li a7, 4
	ecall
	jr ra
