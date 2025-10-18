#include <bits/stdc++.h>
using namespace std;
int main()
{
    int number, weight;
    cout <<"Nuber and weight:" << endl;
    cin>>number>>weight;
    cout<<"enter number and weioght perspectevely:"<<endl;
    vector<int> val(number), wt(number);
    for(int i=0;i<number;i++){
        cin >> val[i]>>wt[i];
    }
    vector<vector<int>> dp(number+1 ,vector<int>(weight+1,0));
    for(int i=1;i<number+1;i++){
        for(int w=1; w<weight+1;w++){
            dp[i][w]=dp[i-1][w];
            if(w-wt[i-1]>=0){
                dp[i][w]=max(dp[i][w],val[i-1]+dp[i-1][w-wt[i-1]]);
            }
        }
    }
    cout << dp[number][weight];
    return 0;
}