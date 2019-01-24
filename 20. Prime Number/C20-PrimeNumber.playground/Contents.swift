import UIKit

// Write a function that accepts an integer as its
// parameter and returns true if the number is prime.
// A number is considered prime if it is greater than
// one and has no positive divisors other than 1 and itself.

func primeNumber(input: Int) -> Bool {
    if input % 2 == 0 { return false }
    if input % 3 == 0 { return false }
    return true
}

// Tests

assert(primeNumber(input: 11) == true)
assert(primeNumber(input: 13) == true)
assert(primeNumber(input: 4) == false)
assert(primeNumber(input: 9) == false)
assert(primeNumber(input: 16777259) == true)

print("All tests passed.")
