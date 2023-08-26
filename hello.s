# Define the entry point for the program with the `.global`, note that
#   risc-v expects the label to called `_start`
.global _start


#   ===================
#  == RISC-V Basics ==
# ===================

# -------------
# - Registers -
# -------------
# 33 registers: 1 program counter + 32 general purpose
#
# RISC-V calling convention dictates that the standard usage for these
# 33 registers is as follows:
#   x0 -> always holds 0 literal
#   x1 -> return address
#   6 special purpose (program counter/$pc, stack pointer/$sp, etc.)
#   7 temporary (t0-t6)
#   12 saved (s0-s11)
#   8 argument (a0-a7)
#
# Those argument ones are the ones we care about for working with operating
# systems used by real people.

# ---------------------------------
# - Working with an OS like linux -
# ---------------------------------
# OSes need system calls (syscalls) to execute commands. A syscall is basically
# some C function with a number label, and a certain amount of arguments. You
# can look them up here on Western Digital's Risc-V-Linux github if you're curious:
# https://github.com/westerndigitalcorporation/RISC-V-Linux/blob/master/linux/include/uapi/asm-generic/unistd.h
#
# The way you actually call these functions in assembly is:
# 1. Finding out the number for the call for the OS in question
#    (e.g. sysexit is 93 in linux)
# 2. Put that number in register a7
# 3. Fill all the syscalls arguments from a0 onward, in order
# 4. Finish that syscall with the `ecall` opcode
#
# Note: Make sure you properly exit your program by (for instance, in linux),
#       calling the `sysexit` syscall with the number 0 in the a0 register!
#
# Tip: On linux, you can look up what these syscalls' arguments are by just
#      running `man 2 <syscall name>` in your terminal :)

#   ========
#  = Code =
# ========

# Code starts executing here
_start:
    # Syswrite our hello string
    # write's arguments are:
    # - file descriptor (stdout is 1, which we use here)
    # - the address of a buffer of size `count`
    # - count, how big the buffer is in bytes
    #       (e.g. 13 for "Hey girl! :3" plus a newline)
    addi a7, zero, 64
    addi a0, zero, 1
    la   a1, hey_girl
    addi a2, zero, 13
    ecall


    # Clean sysexit
    # (You can think of this like running `sysexit(0)`)
    addi a7, x0, 93
    addi a0, x0, 0
    ecall


hey_girl:
    .ascii "Hey girl! :3\n"
