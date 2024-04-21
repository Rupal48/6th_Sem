def countStrings(words) :
    count = 0
    for x in words :
        if len(x) == 2 and x[0]==x[1] :
            count += 1
    return count

words = ["aa","na","Rupal","no"]

print(f"No. of strings of length 2 ans same first and last char is : {countStrings(words)}")