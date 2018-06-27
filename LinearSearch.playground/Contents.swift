import UIKit

// Linear search

func linearSearch<T: Equatable>(_ array: [T], _ object: T) -> Int? {
    for(index, obj) in array.enumerated() where obj == object {
        return index
    }
    return nil
}

linearSearch([2,5,3,6,4], 5)


