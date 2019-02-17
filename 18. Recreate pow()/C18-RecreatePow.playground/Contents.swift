import UIKit

// Create a function that accepts positive two integers,
// and raises the first to the power of the second.

func recreatePow(base: Int, exponent: Int) -> Int {
    guard base > 0, exponent > 0 else { return 0 }
    var output = base
    for _ in 1...(exponent - 1) {
        output *= base
    }
    return output
}

// Tests

assert(recreatePow(base: 2, exponent: 4) == 16)
assert(recreatePow(base: 4, exponent: 3) == 64)
assert(recreatePow(base: 2, exponent: 8) == 256)

print("All tests passed.")
