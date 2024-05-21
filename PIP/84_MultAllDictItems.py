dict = {'A':1,'B':2,'C':3}
ans = 1
for key in dict :
    ans*=dict[key]
    print(key)
print(f"Product of All Elements of the dict is : {ans}")