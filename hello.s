.global _start

_start:
	la a1, helloworld	# *buf
	addi a2, zero, 13	# 13 byte size
	addi a7, zero, 64	# syscall for write
	ecall			# call the set of a7 func, w/ args a0 thru a2 
	addi a0, zero, 0	# linux fd


	addi a7, zero, 93	# linux syscall for exit
	ecall			

helloworld:
	.ascii "Hey girl! ;3\n"

