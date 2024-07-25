# Copyright Tsbih Salman
.data
fizzbuzz:    .asciiz "FizzBuzz"
newLine:     .asciiz "\n"
fizz:        .asciiz "Fizz"
buzz:        .asciiz "Buzz"

    .text
main: 
    li  $t0, 1      # Initialize the loop counter to 1
    li  $t1, 100    # Set the maximum  to 100

loop_start:

    # Check if the number is divisible by both 3 and 5
    li  $t2, 15
    div  $t0, $t2
    mfhi  $t3
    beqz  $t3, print_fizzbuzz

    # Check if the number is divisible by 3
    li  $t2, 3
    div  $t0, $t2
    mfhi  $t3
    beqz  $t3, print_fizz

    # Check if the number is divisible by 5
    li  $t2, 5
    div  $t0, $t2
    mfhi  $t3
    beqz  $t3, print_buzz

    # If not divisible by 3 or 5, print the number
    j print_number

print_fizzbuzz:
    # Print "FizzBuzz"
    la   $a0, fizzbuzz
    li   $v0, 4
    syscall
    j    new_line

print_fizz:
    # Print "Fizz"
    la   $a0, fizz
    li   $v0, 4
    syscall
    j    new_line

print_buzz:
    # Print "Buzz"
    la   $a0, buzz
    li   $v0, 4
    syscall
    j    new_line

print_number:
    # Print the number
    li   $v0, 1
    move $a0, $t0
    syscall

new_line:
    # Print a new line
    la   $a0, newLine
    li   $v0, 4
    syscall

    # Increment the loop counter
    addi $t0, $t0, 1

    # Check if the loop counter is less than or equal to the maximum limit
    ble  $t0, $t1, loop_start

    # Exit the program
    li   $v0, 10
    syscall
