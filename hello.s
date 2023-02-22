.global _start

_start:
	addi a7, zero, 93	# linux syscall for exit
	addi a0, zero, 13
