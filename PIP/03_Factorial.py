def factorial(num) :
    factorial = 1
    for i in range(2,num+1) :
        factorial *= i
    return factorial

num = int(input("Enter the number : "))
print(f"Factorial of the number {num} is : {factorial(num)}")