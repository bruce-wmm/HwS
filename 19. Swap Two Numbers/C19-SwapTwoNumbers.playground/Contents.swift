import UIKit

// Swap two positive variable integers, a and b, without using a temporary variable.

// Tests

func swapTwoNumbers(a: Int, b: Int) -> (a: Int, b: Int) {
    return (b, a)
}

assert(swapTwoNumbers(a: 1, b: 2) == (2, 1))

print("All tests passed.")
