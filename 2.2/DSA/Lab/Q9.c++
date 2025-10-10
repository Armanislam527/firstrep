#include <iostream>
#include <vector>
using namespace std;

int knapsack(int C, vector<int>& W, vector<int>& P, int n) {
    vector<vector<int>> dp(n + 1, vector<int>(C + 1, 0));

    for (int i = 1; i <= n; i++) {
        for (int w = 1; w <= C; w++) {
            if (W[i - 1] <= w)
                dp[i][w] = max(P[i - 1] + dp[i - 1][w - W[i - 1]], dp[i - 1][w]);
            else
                dp[i][w] = dp[i - 1][w];
        }
    }
    return dp[n][C];
}

int main() {
    vector<int> P = {15, 25, 13, 23};
    vector<int> W = {2, 6, 12, 9};
    int C = 20;
    int n = P.size();
    
    cout << "Maximum Profit: " << knapsack(C, W, P, n) << endl;
    return 0;
}
