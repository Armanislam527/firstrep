def subset_sum(S, d, subset=[], index=0):
    if sum(subset) == d:
        print(subset)
        return
    if sum(subset) > d or index >= len(S):
        return
    
    # Include the current element
    subset_sum(S, d, subset + [S[index]], index + 1)
    
    # Exclude the current element
    subset_sum(S, d, subset, index + 1)

# Given set S and target sum d
S = [5, 10, 12, 13, 15, 18, 20]
d = 30
subset_sum(S, d)
