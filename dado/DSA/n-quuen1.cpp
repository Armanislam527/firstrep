#include <bits/stdc++.h>
using namespace std;

int N;

// Function to print the chessboard with queens
void printBoard(vector<string> &board) {
    for (int i = 0; i < N; i++) {
        cout << board[i] << endl;
    }
    cout << endl;
}

// Check if placing queen at board[row][col] is safe
bool isSafe(vector<string> &board, int row, int col) {
    // Check the column
    for (int i = 0; i < row; i++)
        if (board[i][col] == 'Q') return false;

    // Check upper left diagonal
    for (int i = row - 1, j = col - 1; i >= 0 && j >= 0; i--, j--)
        if (board[i][j] == 'Q') return false;

    // Check upper right diagonal
    for (int i = row - 1, j = col + 1; i >= 0 && j < N; i--, j++)
        if (board[i][j] == 'Q') return false;

    return true; // Safe position
}

// Backtracking function
void solve(vector<string> &board, int row)
{
    // Base case: all queens placed
    if (row == N) {
        printBoard(board);
        return;
    }

    // Try placing queen in each column of this row
    for (int col = 0; col < N; col++) {
        if (isSafe(board, row, col))
        {
            board[row][col] = 'Q';   // Place queen
            solve(board, row + 1);   // Recurse to next row
            board[row][col] = '.';   // Backtrack (remove queen)
        }
    }
}

int main() {
    cout << "Enter value of N: ";
    cin >> N;

    // Initialize chessboard with empty places
    vector<string> board(N, string(N, '.'));

    cout << "Solutions for " << N << "-Queens problem:\n\n";
    solve(board, 0);

    return 0;
}