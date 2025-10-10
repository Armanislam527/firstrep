#include <bits/stdc++.h>
using namespace std;

void do_marge(vector<int> &num, int l, int m, int r)
{
    int i = l, j = m;
    vector<int> temp;
    while (i != m && j != r)
    {
        if (num[i] < num[j])
        {
            temp.push_back(num[i]);
            i++;
        }
        else
        {
            temp.push_back(num[j]);
            j++;
        }
    }
    if (i != m)
    {
        for ( ;i < m; i++)
        {
            temp.push_back(num[i]);
        }
    }
    if (j != r)
    {
        for (; j < r; j++)
        {
            temp.push_back(num[j]);
        }
    }

    for (int k = l; k < r; k++)
    {
        num[k] = temp[k - l];
    }
}

void marge_sort(vector<int> &num, int l, int r)
{
    if (r - l == 1)
        return;

    int m = (l + r) / 2;
    marge_sort(num, l, m);
    marge_sort(num, m, r);
    do_marge(num, l, m, r);
}

int main()
{
    cout << "Enter total number of array elements: ";
    int n;
    cin >> n;
    cout << "Enter elements of array: ";
    vector<int> num(n);
    for (int i = 0; i < n; i++)
    {
        cin >> num[i];
    }
    marge_sort(num, 0, n);
    cout << "Sorted array: ";
    for (int i : num)
    {
        cout << i << " ";
    }
    cout << endl;
    return 0;
} 