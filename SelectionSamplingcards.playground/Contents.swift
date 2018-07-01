import Foundation

// sample sampling
// selecting `k` number of items from array randomly
public func random(min: Int, max: Int) -> Int {
    assert(min < max)
    return min + Int(arc4random_uniform(UInt32(max - min + 1)))
}

func select<T>(_ arr:[T], _ items:Int) -> [T] {
    var arr = arr
    for i in 0..<items {
    let randomIndex = random(min: i, max: arr.count - 1)
           if i != randomIndex {
        arr.swapAt(i, randomIndex)
            }
    }
    return Array(arr[0..<items])
}

let input = [
    "there", "once", "was", "a", "man", "from", "nantucket",
    "who", "kept", "all", "of", "his", "cash", "in", "a", "bucket",
    "his", "daughter", "named", "nan",
    "ran", "off", "with", "a", "man",
    "and", "as", "for", "the", "bucket", "nan", "took", "it",
]

let output = select(input, 4)
print(output)
print(output.count)
