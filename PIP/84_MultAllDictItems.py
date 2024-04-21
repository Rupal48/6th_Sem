dict = {'A':1,'B':2,'C':3}
ans = 1
for x in dict :
    ans*=dict[x]
for key in dict :
    print(key)
print(f"Product of All Elements of the dict is : {ans}")