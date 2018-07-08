import UIKit

let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]

func binarySearch<T: Comparable>(_ array : [T], key:T, _ range: Range<Int>) -> Int? {
    
    if range.lowerBound >= range.upperBound {
        return nil
    }
    
    else {
        let middleIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        
        if array[middleIndex] < key  {
           return binary(array, key: key, middleIndex+1 ..< range.upperBound)
        }
        
        else if array[middleIndex] > key {
            return binary(array, key: key, range.lowerBound..<middleIndex)
        }
        else {
            return middleIndex
        }
    }
}

binarySearch(numbers, key: 13, 0..<numbers.count)
