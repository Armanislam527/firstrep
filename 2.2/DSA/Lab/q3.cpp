#include<bits/stdc++.h>
using namespace std;

void merge(vector<int> &arr, int st, int mid,int end){
    int i=st, j = mid+1;
    vector<int> tmp;
    while(i<=mid && j<=end){
        if(arr[i] < arr[j]){
            tmp.push_back(arr[i]);
            i++;
        }else{
            tmp.push_back(arr[j]);
            j++;
        }
    }

    while(i<=mid){
        tmp.push_back(arr[i]);
        i++;
    }

    while(j<=end){
        tmp.push_back(arr[j]);
        j++;
    }

    for(int indx = 0; indx<tmp.size(); indx++){
        arr[indx+st] = tmp[indx];
    }
}

void mergeSort(vector<int> &arr, int st, int end){
    if(st < end){
        int mid = st + (end-st)/2;
        mergeSort(arr, st, mid);
        mergeSort(arr, mid+1, end);

        merge(arr, st, mid, end);
    }
}

int main(){
    vector<int> arr = {12, 13, 43, 1, 2, 56};
    mergeSort(arr, 0, arr.size()-1);

    for(int val: arr){
        cout << val <<" ";
    }
    return 0;
}