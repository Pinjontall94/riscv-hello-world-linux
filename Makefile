default:
	rm -rf hello
	riscv64-linux-gnu-as hello.s -o hello.o
	riscv64-linux-gnu-gcc -o hello hello.o -nostdlib -static

clean:
	rm -rf hello hello.o
