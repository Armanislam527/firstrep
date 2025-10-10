def binary_sort(arr, target):
    low = 0
    high = len(arr) - 1
    while low <= high:
        mid = (low + high) // 2
        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            low = mid + 1
        elif arr[mid] > target:
            high = mid -1
    return -1

arr = [2, 3, 4,10, 35]
print("Element found at index:",binary_sort(arr, 35))