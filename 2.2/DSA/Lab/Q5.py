def pattern(text, case):
    n, m = len(text), len(case)
    for i in range(n-m+1):
        if text[i:i+m] == case:
            return i
    return -1

text = "this is a simple example"
case = "simple"
print("Pattern found at index:", pattern(text, case))
