#include<bits/stdc++.h>
using namespace std;
int tower_of_hanoi(int n,char from_rod,char torod,char auxrod){
    if(n==1){
        cout<<"move rod 1 from: "<<from_rod<<" to "<<torod<<endl;
        return 0;
    }
    tower_of_hanoi(n-1,from_rod,auxrod,torod);
    cout<<"move rod from: "<<from_rod<<" to "<<torod<<endl;
    tower_of_hanoi(n-1,auxrod,torod,from_rod);
    return 0;
}
int main(){
    int n;
    cout<<"enter:"<<endl;
    cin>>n;
    tower_of_hanoi(n,'a','b','c');
    return 0;
}