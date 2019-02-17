import Foundation

// Create a function that subtracts one positive integer from another, without using -.

func subtractByHand(_ x: Int, from: Int) -> Int {
    return from + (~x + 1)
}

// Tests

assert(subtractByHand(5, from: 9) == 4)
assert(subtractByHand(10, from: 30) == 20)

print("All tests passed.")
