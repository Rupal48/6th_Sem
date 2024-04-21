def reverse(str) :
    rev = ""
    for i in str :
        rev = i + rev
    return rev

str = input("Enter you string : ")
print(f"Your string in reversed form is : {reverse(str)}")