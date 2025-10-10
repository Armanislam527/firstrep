#include <iostream>
#include <vector>
using namespace std;

int main()
{
    int n;
    cout << "Enter the size of the sorted array: ";
    cin >> n;

    vector<int> arr(n);
    cout << "Enter " << n << " elements in ascending order: ";
    for (int i = 0; i < n; i++)
    {
        cin >> arr[i];
    }

    int target;
    cout << "Enter the element to search: ";
    cin >> target;

    int l = 0, r = n - 1;
    bool found = false;

    while (l <= r)
    {
        int middle = (l + r) / 2;

        if (arr[middle] == target)
        {
            cout << "Element found: " << target << " at index " << middle << endl;
            found = true;
            return 1;
        }
        else if (arr[middle] < target)
        {
            l = middle + 1;
        }
        else
        {
            r = middle - 1;
        }
    }

    if (!found)
    {
        cout << "Element " << target << " not found in the array." << endl;
    }

    return 0;
}