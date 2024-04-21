def bubble_sort(names):
    n = len(names)
    for i in range(0,n) :
        for j in range(0,n-i-1) :
            if names[j] > names[j+1] :
                temp = names[j]
                names[j] = names[j+1]
                names[j+1] = temp

names = ["John", "Alice", "Bob", "Charlie", "Emma"]
print(f"Original list: {names}")
bubble_sort(names)
print(f"Sorted list: {names}")
