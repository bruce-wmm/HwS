import Foundation

// Write a function that accepts an integer as its
// parameter and returns true if the number is prime.
// A number is considered prime if it is greater than
// one and has no positive divisors other than 1 and itself.

// Brute force approach

//func primeNumber(input: Int) -> Bool {
//    guard input >= 2 else { return false }
//
//    for i in 2...Int(ceil(sqrt(Double(input)))) {
//        if input % i == 0 { return false }
//    }
//    return true
//}

// Elegant approach

func primeNumber(_ input: Int) -> Bool {
    if input % 2 == 0 { return false }
    
    var largestPossibleDivisor = (input + 1) / 2
    var tester = 3
    
    while tester < largestPossibleDivisor {
        if input % tester == 0 { return false }
        largestPossibleDivisor = (input + 1) / tester
        tester += 1
    }
    
    return true
}

// Tests

assert(primeNumber(11) == true)
assert(primeNumber(13) == true)
assert(primeNumber(25) == false)
assert(primeNumber(4) == false)
assert(primeNumber(9) == false)
assert(primeNumber(16777259) == true)

print("All tests passed.")
