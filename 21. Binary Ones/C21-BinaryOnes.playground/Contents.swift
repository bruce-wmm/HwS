import Foundation

// Create a function that accepts any positive integer and
// returns the next highest and next lowest number that has
// the same number of ones in its binary representation. If
// either number is not possible, return nil for it.

func binaryOnes(_ input: Int) -> (high: Int, low: Int) {
    var highest = input
    var lowest = input
    
    repeat {
        highest += 1
    } while input.nonzeroBitCount != highest.nonzeroBitCount
    
    repeat {
        lowest -= 1
    } while input.nonzeroBitCount != lowest.nonzeroBitCount
    
    return (highest, lowest)
}

// Tests

assert(binaryOnes(12) == (17, 10))
assert(binaryOnes(28) == (35, 26))
assert(binaryOnes(100) == (104, 98))

print("All tests passed.")
