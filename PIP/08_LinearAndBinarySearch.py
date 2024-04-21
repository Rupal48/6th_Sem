def linearSearch(lst,target) :
    n = len(lst)
    for i in range(0,n) :
        if lst[i] == target :
            return i
    return -1

def binarySearch(lst,target) :
    n = len(lst)
    start = 0
    end = n-1
    while start <= end :
        mid = start + (end-start)//2
        if lst[mid] == target :
            return mid
        if lst[mid] < target :
            start = mid+1
        else :
            end = mid-1
    return -1

lst = [1,2,3,4,5]
target = 3
print(f"{target} is found at index {linearSearch(lst,target)}")
target = 5
print(f"{target} is found at index {binarySearch(lst,target)}")