import UIKit

/// Queue Implementation in swift 4 using generics
/// FIFO - FirstCome first serve

struct Queue<T> {
    var array : [T] = []
    
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public func isEmpty() -> Bool {
        return array.isEmpty
    }
    
    mutating func dequeue() -> T? {
        if isEmpty() {
            return nil
        }
        else {
            return array.removeFirst()
        }
    }
    
    public func first() -> T? {
        return array.first
    }
    
    public func count() -> Int {
        return array.count
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        let queueStart = "Queue Start\n"
        let queueEnd = "\nQueue End"
        
        let queueValues = array.map{"\($0)"}.joined(separator: "\n")
        
        return queueStart + queueValues + queueEnd
    }
}
var queueInt = Queue<Int>()

queueInt.enqueue(1)
queueInt.enqueue(2)
queueInt.enqueue(3)


print(queueInt)

print(queueInt.dequeue() ?? "No value in the queue")

print(queueInt.dequeue() ?? "No value in the queue")

print(queueInt.dequeue() ?? "No value in the queue")

print(queueInt.first() ?? "No value in the queue")

print(queueInt)
