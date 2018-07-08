import UIKit

func binarySearch<T: Comparable>(_ array:[T], object:T) -> Int? {
    var lowerBound = 0
    var upperBound = array.count
    
    while lowerBound < upperBound {
       let middleIndex = lowerBound + (upperBound - lowerBound) / 2

        if array[middleIndex] == object {
            return middleIndex
        }
        else if array[middleIndex] < object {
            lowerBound = middleIndex + 1
        }
        else if array[middleIndex] > object {
            upperBound = middleIndex
        }
    }
    return nil
}


binarySearch([2,3,45,67,89,98,304], object: 304)

let a = [ 0, 1, 1, 3, 3, 3, 6, 8, 10, 11, 11 ]


