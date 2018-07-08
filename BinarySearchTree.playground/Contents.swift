//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

public class BinarySearchTree<T: Comparable> {
    /// private setter , public getter :)
    private(set) public var value: T
    private(set) public var left: BinarySearchTree?
    private(set) public var parent: BinarySearchTree?
    private(set) public var right: BinarySearchTree?
    
    init(value: T) {
        self.value = value
    }
    
    public var isRoot : Bool {
      return parent == nil
    }
    
    public var isLeaf : Bool {
        return left == nil && right == nil
    }
    
    public var isLeftChild : Bool {
        return parent?.left === self
    }
    
    public var isRightChild : Bool {
        return parent?.right === self
    }
    
    public var hasLeftChild : Bool {
        return left != nil
    }
    
    public var hasRightChild : Bool {
        return right != nil
    }
    
    public var hasAnyChild: Bool {
        return left != nil || right != nil
    }
    
    public var hasBothChild: Bool {
        return left != nil && right != nil
    }
    
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
    public func insert(value: T) {
        if value < self.value {
            if let left = left {
               left.insert(value: value)
            }
            else { /// If there is no more left or right child to look at, we create a BinarySearchTree object for the new node and connect it to the tree by setting its parent property.
                left = BinarySearchTree(value: value)
                left?.parent = self
            }
        }
        else {
            if let right = right {
                right.insert(value: value)
            }
            else {
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
    }
    
    
     public func search(value : T) -> BinarySearchTree? {
        var node: BinarySearchTree? = self
        while let n = node {
            if value < n.value {
                node = n.left
            }
            else if value > n.value {
                node = n.right
            }
            else {
                return node
            }
        }
        return nil
    }
    
    public func traverseInOrder(process: (T) -> Void) {
        left?.traverseInOrder(process: process)
        process(value)
        right?.traverseInOrder(process: process)
    }
    
    public func traversePreOrder(process: (T) -> Void) {
        process(value)
        left?.traversePreOrder(process: process)
        right?.traversePreOrder(process: process)
    }
    
    public func traversePostOrder(process: (T) -> Void) {
        left?.traversePostOrder(process: process)
        right?.traversePostOrder(process: process)
        process(value)
    }
    
    
    private func reconnectParentTo(node: BinarySearchTree?) {
        if let parent = parent {
            if isLeftChild {
                parent.left = node
            } else {
                parent.right = node
            }
        }
        node?.parent = parent
    }
    
    public func minimum() -> BinarySearchTree {
        var node = self
        while let next = node.left {
            node = next
        }
        return node
    }
    
    public func maximum() -> BinarySearchTree {
        var node = self
        while let next = node.right {
            node = next
        }
        return node
    }
    
    @discardableResult public func remove() -> BinarySearchTree? {
        let replacement: BinarySearchTree?
        
        // Replacement for current node can be either biggest one on the left or
        // smallest one on the right, whichever is not nil
        if let right = right {
            replacement = right.minimum()
        } else if let left = left {
            replacement = left.maximum()
        } else {
            replacement = nil
        }
        
        replacement?.remove()
        
        // Place the replacement on current node's position
        replacement?.right = right
        print(replacement?.right)
        replacement?.left = left
        print(replacement?.left)
        right?.parent = replacement
        print(right?.parent)
        left?.parent = replacement
        print(left?.parent)
        reconnectParentTo(node:replacement)
        
        // The current node is no longer part of the tree, so clean it up.
        parent = nil
        left = nil
        right = nil
        
        return replacement
    }
}

extension BinarySearchTree : CustomStringConvertible {
    public var description : String {
        var s = ""
        if let left = left {
            s += "((\(left.description) <-"
        }
       s += "\(value)"
        if let right = right {
            s += "-> (\(right.description))"
        }
        return s
    }
}


let tree = BinarySearchTree<Int>(value: 7)
tree.insert(value: 2)
tree.insert(value: 5)
tree.insert(value: 10)
tree.insert(value: 6)
tree.insert(value: 1)


tree.search(value: 7)

tree.traversePreOrder { print($0) }

/// if let vs guard
//let optionalString: String? = nil
//if let string = optionalString {
//    print(string)
//} else {
//    print("Wooops! No string")
//}
//
//func fooGuard(x: Int?) {
//    guard let x = x , x > 0 else {
//        // Value requirements not met, do something
//        fatalError("crash")
//    }
//
//    // Do stuff with x
//    x.description
//}
//
////fooGuard(x: 3)
//fooGuard(x: nil)

