//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

///Map
///Loops over a collection and applies the same operation to each element in the collection.

var arr = [1,2,3,4,5,6,7,8,9,10]

var twoTable = arr.map{$0 * 2}

print(twoTable)

//Filter
//Loops over a collection and returns an array that contains elements that meet a condition.

func intersection<T:Hashable>(_ arr1:[T] , _ arr2:[T]) -> Set<T> {
    let set1:Set<T> = Set(arr1)
    let set2:Set<T> = Set(arr2)
    
    let intersectionArray = set1.filter{set2.contains($0)}
    
    return intersectionArray
}

let a = [1,2,56,89]
let b = [2,1,0,9]
intersection(a , b)

func intersectionP<T:Hashable>(_ arr1:[T] , _ arr2:[T]) -> Set<T> {
    
    let set1:Set<T> = Set(arr1)
    let set2:Set<T> = Set(arr2)
    
    let intersectionArray = set1.union(set2)
    
    return intersectionArray
}

intersectionP(a, b)

// flatteing array using recursion -


func flatennedArray(_ arr:[Any]) -> [Int] {
    
    var myFlattenedArray = [Int]()
    
    for x in arr {
        print(x)
        if x is Int {
            myFlattenedArray.append(x as! Int)
        }
        else if x is [Any] {
            let nestedElements = flatennedArray(x as! [Any])
            for x in nestedElements {
                myFlattenedArray.append(x)
            }
        }
    }
    return myFlattenedArray
}

flatennedArray([1,[2,3, [4,5]]])
