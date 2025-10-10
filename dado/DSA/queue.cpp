#include <iostream>
#include <vector>
using namespace std;

class Queue {
private:
    vector<int> q;

public:
    bool isEmpty() {
        return q.empty();
    }

    void enqueue(int value) {
        q.push_back(value);
        cout << value << " enqueued into queue" << endl;
        display();
        totalElements();
    }

    void dequeue() {
        if (isEmpty()) {
            cout << "Queue Underflow! Cannot dequeue" << endl;
        } else {
            cout << q.front() << " dequeued from queue" << endl;
            q.erase(q.begin());
            display();
            totalElements();
        }
    }

    void peek() {
        if (isEmpty()) {
            cout << "Queue is empty!" << endl;
        } else {
            cout << "Front element: " << q.front() << endl;
        }
    }

    void display() {
        if (isEmpty()) {
            cout << "Queue is empty!" << endl;
        } else {
            cout << "\nQueue (Rear -> Front):" << endl;
            for (int i = q.size() - 1; i >= 0; i--) cout << "-----";
            cout << endl;

            for (int i = q.size() - 1; i >= 0; i--) cout << "| " << q[i] << " |";
            cout << endl;

            for (int i = q.size() - 1; i >= 0; i--) cout << "-----";
            cout << endl;
        }
    }

    void totalElements() {
        cout << "Total elements in queue: " << q.size() << endl;
    }
};

int main() {
    Queue queue;
    int choice, value;

    while (true) {
        cout << "\n1. Enqueue\n2. Dequeue\n3. Peek\n4. Display Queue\n5. Total Elements\n6. Exit\n";
        cout << "Enter your choice: ";
        cin >> choice;

        switch (choice) {
            case 1:
                cout << "Enter value to enqueue: ";
                cin >> value;
                queue.enqueue(value);
                break;
            case 2:
                queue.dequeue();
                break;
            case 3:
                queue.peek();
                break;
            case 4:
                queue.display();
                break;
            case 5:
                queue.totalElements();
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
