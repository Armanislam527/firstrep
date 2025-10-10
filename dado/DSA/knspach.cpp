#include <bits/stdc++.h>
using namespace std;

int main() {
    int n, W;
    cout << "Enter total item number and total weight of the sack: ";
    cin >> n >> W;

    vector<int> val(n), wt(n);
    cout << "Enter value and weight for each item:\n";
    for (int i = 0; i < n; i++) {
        cin >> val[i] >> wt[i];
    }

    // DP table: (n+1) x (W+1)
    vector<vector<int>> dp(n + 1, vector<int>(W + 1, 0));

    // Fill table
    for (int i = 1; i <= n; i++) {
        for (int w = 0; w <= W; w++) {
            // not take item i-1
            dp[i][w] = dp[i-1][w];

            // take item i-1 if it fits
            if (w - wt[i-1] >= 0) {
                dp[i][w] = max(dp[i][w], val[i-1] + dp[i-1][w - wt[i-1]]);
            }
        }
    }

    cout << "Maximum value sack can carry is: " << dp[n][W] << endl;
    return 0;
}
