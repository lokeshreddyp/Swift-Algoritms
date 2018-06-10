//: Playground - noun: a place where people can play

import UIKit

/// Stack - Last In First Out

struct Stack {
    fileprivate var array: [String] = []
    
    mutating func push(_ element: String) {
        array.append(element)
    }
    
    mutating func pop() -> String? {
        return array.popLast()
    }
    
    mutating func peek() -> String? {
        return array.last
    }
}


/// Swift has a built in protocol called CustomStringConvertible that
/// allows you to define how you want to represent an object as a string

extension Stack : CustomStringConvertible {
    var description: String {
        let topDivider = "--Stack Top-- \n"
        let bottomDivider = "\n--Stack Bottom--"
        
        let stackValues = array.reversed().joined(separator: "\n")
        
        return topDivider + stackValues + bottomDivider
    }
}

var cars = Stack()

cars.push("BMW")
cars.push("Honda")
cars.push("lancer")

cars.peek()


print(cars)

