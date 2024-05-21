def bubbleSort(arr):
    for i in range(n):
        for j in range(n-i-1):
            if arr[j] > arr[j+1]:
                temp = arr[j]
                arr[j] = arr[j+1]
                arr[j+1] = temp
lst = []
n = int(input("Enter no. of elements in the list : "))
print("Enter the elements : ")
for i in range(0,n) :
    ele = int(input())
    lst.append(ele)
bubbleSort(lst)
print("Printing the list in sorted manner : ")
print(lst)