import Foundation

// kth min sorted[k-1]
// kth largest sorted[count-k]
// nlogn
func kthLargestElement(_ array:[Int], k:Int) -> Int? {
    let count = array.count

    if k>0 && k<count {

    let sorted = array.sorted()

   return sorted[count-k]
}
    else {
        return nil
    }
}
let a = [4,1,0,-1,3,9,2]

kthLargestElement(a, k: 2)
