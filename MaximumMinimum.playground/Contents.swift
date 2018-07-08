import UIKit

let arr = [ 10,8, 3, 9, 6, 4 ]

func maxMin<T: Comparable>(_ array:[T]) -> (minumum:T, maximum:T)? {
 
    // get the first element from the array and make it as minimum
    guard var minimum = array.first else {
        return nil
    }
    
    // store first element from the array into maximum as well
    var maximum = minimum
    
    // if we have odd number of elements in the array, remove first one
    // this will return one if elements are odd
    let start = array.count % 2
    
    for i in stride(from: start, to: array.count, by: 2) {
     let pair = (array[i], array[i+1])
        if pair.0 > pair.1 {
            if pair.0 > maximum {
                maximum = pair.0
            }
            if pair.1 < minimum {
                minimum = pair.1
            }
        }
        
        else {
            if pair.1 > maximum {
                maximum = pair.1
            }
            if pair.0 < minimum {
                minimum = pair.0
            }
        }
    }
    return(maximum, minimum)
}

let r = maxMin(arr)!

r.maximum
r.minumum
