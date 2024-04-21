import sys

str = "forof"
n = len(str)
for i in range(0,(n-1)//2) :
    if str[i] != str[n-i-1] :
        print(f"{str} is not a palindrome")
        sys.exit()
print(f"{str} is palindrome")