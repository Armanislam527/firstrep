class Queue:
    def __init__(self):
        self.queue = []

    def enqueue(self, item):
        self.queue.append(item)

    def dequeue(self):
        if not self.is_empty():
            return self.queue.pop(0)
        return "Queue is empty"

    def is_empty(self):
        return len(self.queue) == 0

    def peek(self):
        if not self.is_empty():
            return self.queue[0]
        return "Queue is empty"

    def display(self):
        return self.queue

# Example
q = Queue()
q.enqueue(10)
q.enqueue(20)
q.enqueue(30)
print("Queue after enqueue:", q.display())
print("Dequeued element:", q.dequeue())
print("Queue after dequeue:", q.display())
