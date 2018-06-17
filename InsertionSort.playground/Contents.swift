import UIKit

let list = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]


func insertion(_ arr:[Int]) -> [Int] {
    var a = arr
    
    for i in 1..<a.count {
        // gets the index of the array
        var j = i
        // get the value from index j
        let temp = a[j]
        
        // -1(index 1) < 10(index 0) - true , so it enters
        //
        while j>0 && temp < a[j-1] {
            // Shift 10 to index 1
            a[j] = a[j-1]
            // Decrement j's count
            j -= 1
        }
        // move temp value to index 0
        a[j] = temp
    }
    return a
}

insertion(list)

// insertion sort using generics
// swift uses this in sort algorithm `isOrdedWith`


func insertionSortGenerics<T>(_ array : [T], _ isOrdedWith : (T,T) -> Bool) -> [T] {
    
    // copy the existing array into a new array
    var arr = array
    
    //start a new loop from 1
    for i in 1..<arr.count {
        // it will store first index of the array
        var j = i
        
        // this temp caruable
        var temp = arr[j]
        
        // if j's index is greater than 0 and comparing value at index one and value at index 0
        while j>0 && isOrdedWith(temp, arr[j-1]) {
            // shifting the positions if second number is less than first
            arr[j] = arr[j-1]
            // decrement the index
            j = j-1
        }
        // move temp value into jth index
        arr[j] = temp
    }
    return arr
}

insertionSortGenerics(list, >)

insertionSortGenerics(list, <)


