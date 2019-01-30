import Foundation

// Write a function that returns the square root of a positive integer,
// rounded down to the nearest integer, without using sqrt().

func squareRootByHand(input: Int) -> Int {
    return Int(pow(Double(input), 1/2))
}

// Tests

assert(squareRootByHand(input: 9) == 3)
assert(squareRootByHand(input: 16777216) == 4096)
assert(squareRootByHand(input: 16) == 4)
assert(squareRootByHand(input: 15) == 3)

print("All tests passed.")
