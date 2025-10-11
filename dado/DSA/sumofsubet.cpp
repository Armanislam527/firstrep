#include <iostream>
#include <vector>

// This line allows us to use names for objects and variables from the standard library.
using namespace std;

// Function to print a found subset
void printSubset(const vector<int>& subset) {
    cout << "{ ";
    for (size_t i = 0; i < subset.size(); ++i) {
        cout << subset[i]; // Always print the number
        
        // Use a standard if-statement to handle the comma
        if (i < subset.size() - 1) {
            cout << ", "; // If it's not the last element, print a comma
        }
    }
    cout << " }" << endl;
}

/**
 * @brief Solves the Sum of Subset problem using backtracking.
 * (The rest of the code is unchanged)
 */
void findSubsets(const vector<int>& set, vector<int>& subset, int index, int targetSum) {
    // Base Case 1: If the target sum is 0, we found a valid subset.
    if (targetSum == 0) {
        printSubset(subset);
        return;
    }

    // Base Case 2: If we have run out of numbers or the sum is negative, backtrack.
    if (index >= set.size() || targetSum < 0) {
        return;
    }

    // Recursive Step 1: *Include* the current element set[index]
    subset.push_back(set[index]);
    findSubsets(set, subset, index + 1, targetSum - set[index]);

    // Backtrack: *Exclude* the current element by removing it
    subset.pop_back();
    findSubsets(set, subset, index + 1, targetSum);
}

int main() {
    // Given set and target sum
    vector<int> S = {5, 10, 12, 13, 15, 17, 18, 20, 25};
    int d = 30;

    cout << "Given Set S = {5, 10, 12, 13, 15, 17, 18, 20, 25} and d = " << d << endl;
    cout << "The subsets that sum to 30 are:" << endl;

    // A vector to store the current subset being considered
    vector<int> currentSubset;

    // Start the recursive search from the first element (index 0)
    findSubsets(S, currentSubset, 0, d);

    return 0;
}