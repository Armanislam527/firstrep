#include <iostream> 
#include <vector> 
using namespace std; 
class Stack 
{ 
private: 
    vector<int> v; 
 
public: 
    bool isEmpty() 
    { 
        return v.empty(); 
    }   
 
    void push(int value) 
    { 
        v.push_back(value); 
        cout << value << " pushed into stack" << endl; 
        cout << "Total elements in stack: " << v.size() << endl; 
        display(); 
    } 
 
    void pop() 
    { 
        if (isEmpty()) 
        { 
            cout << "Stack Underflow! Cannot pop" << endl; 
        } 
        else 
        { 
            cout << v.back() << " popped from stack" << endl; 
            v.pop_back(); 
            cout << "Total elements in stack: " << v.size() << endl; 
            display(); 
        } 
    } 
 
    void peek() 
    { 
        if (isEmpty()) 
        { 
            cout << "Stack is empty!" << endl; 
        } 
        else 
        { 
            cout << "Top element: " << v.back() << endl; 
        } 
    } 
 
    void display() 
    { 
        if (isEmpty()) 
        { 
            cout << "Stack is empty!" << endl; 
        } 
        else 
        { 
            cout << "\nCurrent Stack (Top to Bottom):" << endl; 
             
            for (int i = v.size() - 1; i >= 0; i--) 
            { 
                cout << "-----" << endl; 
                cout << "| " << v[i] << " |" << endl;  
            } 
            cout << "-----" << endl;  
        } 
    } 
 
    void totalElements() 
    { 
        cout << "Total elements in stack: " << v.size() << endl; 
    } 
}; 
 
int main() 
{ 
    Stack s; 
    int choice, value; 
 
    while (true) 
    { 
        cout << "\n1. Push" << endl; 
        cout << "2. Pop" << endl; 
        cout << "3. Peek (Top Element)" << endl; 
        cout << "4. Display Stack" << endl; 
        cout << "5. Total Elements" << endl; 
        cout << "6. Exit" << endl; 
        cout << "Enter your choice: "; 
        cin >> choice; 
 
        switch (choice) 
        { 
        case 1: 
            cout << "Enter value to push: "; 
            cin >> value; 
            s.push(value); 
            break; 
        case 2: 
            s.pop(); 
            break; 
        case 3: 
            s.peek(); 
            break; 
        case 4: 
            s.display(); 
break; 
case 5: 
s.totalElements(); 
break; 
case 6: 
cout << "Exiting program..." << endl; 
return 0; 
default: 
cout << "Invalid choice! Please try again." << endl; 
} 
} 
return 0; 
} 