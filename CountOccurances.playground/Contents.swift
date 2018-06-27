import UIKit

//let a = [ 0, 1, 1, 3, 3, 3, 3, 6, 8, 10, 11, 11,]

let a = ["a","a","a","a","b","c","d","e","f"]
func countNumberOfOccurances<T: Comparable>(_ array:[T], _ key:T) -> Int? {
    func leftPart() -> Int {
        var low = 0
        var high = array.count
        
        while low < high {
            let midindex = low + (high - low)/2
            if array[midindex] < key {
                low = midindex + 1
            }
            else {
                high = midindex
            }
        }
        return low
    }
    
    func rightPart() -> Int {
        var low = 0
        var high = array.count
        
        while low < high {
            let midindex = low + (high - low)/2
            if array[midindex] > key {
                high = midindex
            }
            else {
                low = midindex + 1
            }
        }
        return low
    }
    
    return rightPart() - leftPart()
}

countNumberOfOccurances(a, "a")

