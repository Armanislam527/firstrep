def knapsack_01(profits, weights, capacity, n):
    """
    Solve 0/1 Knapsack problem using dynamic programming.
    
    Parameters:
    profits (list): List of profits for each item
    weights (list): List of weights for each item
    capacity (int): Maximum capacity of knapsack
    n (int): Number of items
    
    Returns:
    tuple: (Maximum profit, Selected items)
    """
    # Initialize the DP table with 0s
    dp = [[0 for _ in range(capacity + 1)] for _ in range(n + 1)]
    # To keep track of selected items
    selected = [[False for _ in range(capacity + 1)] for _ in range(n + 1)]
    
    # Build DP table
    for i in range(1, n + 1):
        for w in range(capacity + 1):
            if weights[i-1] <= w:
                # If including the current item gives better profit
                if profits[i-1] + dp[i-1][w-weights[i-1]] > dp[i-1][w]:
                    dp[i-1][w] = dp[i-1][w]
                    dp[i][w] = profits[i-1] + dp[i-1][w-weights[i-1]]
                    selected[i][w] = True
                else:
                    dp[i][w] = dp[i-1][w]
            else:
                dp[i][w] = dp[i-1][w]
    
    # Find selected items
    selected_items = []
    w = capacity
    for i in range(n, 0, -1):
        if selected[i][w]:
            selected_items.append(i-1)
            w -= weights[i-1]
    
    return dp[n][capacity], selected_items

def print_solution(profits, weights, capacity, max_profit, selected_items):
    """Print the solution in a readable format"""
    print("\nKnapsack Solution:")
    print("----------------")
    print(f"Capacity: {capacity}")
    print(f"Maximum Profit: {max_profit}")
    print("\nSelected Items:")
    print("Item\tProfit\tWeight")
    total_weight = 0
    for idx in selected_items:
        print(f"{idx + 1}\t{profits[idx]}\t{weights[idx]}")
        total_weight += weights[idx]
    print(f"\nTotal Weight: {total_weight}")
    print(f"Total Profit: {max_profit}")

# Given problem instance
profits = [15, 25, 13, 23]
weights = [2, 6, 12, 9]
capacity = 20
n = 4

# Solve the problem
max_profit, selected_items = knapsack_01(profits, weights, capacity, n)

# Print the solution
print("\nProblem Instance:")
print("----------------")
print(f"Profits: {profits}")
print(f"Weights: {weights}")
print(f"Capacity: {capacity}")
print(f"Number of items: {n}")

print_solution(profits, weights, capacity, max_profit, selected_items)

# Print the decision for each item
print("\nDecisions:")
for i in range(n):
    if i in selected_items:
        print(f"Item {i+1}: Selected")
    else:
        print(f"Item {i+1}: Not selected")