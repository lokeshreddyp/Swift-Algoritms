import UIKit

/// T is a generic value , it can take any type of value as string
struct Stack<T> {
    fileprivate var array : [T] = []
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    /// If stack is empty value may be nil, we had an optional here
    mutating func pop() -> T? {
        return array.popLast()
    }
    
    mutating func peek()-> T? {
        return array.last
    }
    
    /// this function checks whether is empty or not
    mutating func isEmpty() -> Bool {
        return array.isEmpty
    }
    
    /// This function checks for number of elements in the array
    mutating func count() -> Int? {
        return array.count
    }
}

extension Stack : CustomStringConvertible {
    var description: String {
        let stackTop = "Stack Top-----\n"
        let stackBottom = "\nStack Bottom---"
        
        let stackValues = array.map{"\($0)"}.reversed().joined(separator: "\n")
        
        return stackTop + stackValues + stackBottom
    }
}

var stackInt = Stack<Int>()
/// Push three elements
stackInt.push(1)
stackInt.push(2)
stackInt.push(3)


stackInt.peek()

print(stackInt)

var stackString = Stack<String>()
/// Push three elements
stackString.push("one")
stackString.push("two")
stackString.push("three")

stackString.peek()

print(stackString)

