# riscv-hello-world-linux
### Description
This repo contains a "hello world"-type example program for risc-v on a 64-bit linux system

### How to run? Help, I don't have a risc-v board! :(
No prob, I don't either! Well, it's sitting in my desk, but I have my laptop now and I'm lazy 
while I'm learning assembly ;3 In any case, this is designed to run on a virtual risc-v machine
you can run on any typical linux box. 

####Install
* `gcc-riscv64-linux-gnu`
* `qemu-system-riscv` 
* `qemu-user`
* `make`

####Build
Open a terminal and run the following:
* `git clone git@github.com:Pinjontall94/riscv-hello-world-linux.git`
* `cd riscv-hello-world-linux`
* `make`

####Run 
In the same terminal and folder, run the following:
* `make run`

### TODO
* Rewrite the existing make file in wake to learn *that* build tool :)
