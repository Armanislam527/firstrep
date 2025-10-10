def tower_of_hanoi(n, source, auxiliary, target):
    """
    Solve the Tower of Hanoi puzzle for n disks.
    
    Parameters:
    n (int): Number of disks
    source (str): Starting rod
    auxiliary (str): Helper rod
    target (str): Destination rod
    
    Returns:
    list: List of moves, where each move is a tuple (disk, from_rod, to_rod)
    """
    moves = []
    
    def hanoi_recursive(n, source, auxiliary, target):
        if n == 1:
            moves.append((1, source, target))
            return
        
        # Move n-1 disks from source to auxiliary rod
        hanoi_recursive(n-1, source, target, auxiliary)
        
        # Move the largest disk from source to target
        moves.append((n, source, target))
        
        # Move n-1 disks from auxiliary to target rod
        hanoi_recursive(n-1, auxiliary, source, target)
    
    hanoi_recursive(n, source, auxiliary, target)
    return moves

def print_solution(n, moves):
    """Print the solution in a readable format"""
    print(f"\nSolution for {n} disks:")
    print(f"Total moves required: {len(moves)}")
    print("\nStep by step solution:")
    for i, (disk, source, target) in enumerate(moves, 1):
        print(f"Step {i}: Move disk {disk} from rod {source} to rod {target}")

# Example usage
def main():
    n = 7  # Number of disks
    source = 'A'  # Source rod
    auxiliary = 'B'  # Auxiliary rod
    target = 'C'  # Target rod
    
    moves = tower_of_hanoi(n, source, auxiliary, target)
    print_solution(n, moves)
    
    # Print theoretical minimum moves required
    print(f"\nMinimum number of moves required: {2**n - 1}")

if __name__ == "__main__":
    main()