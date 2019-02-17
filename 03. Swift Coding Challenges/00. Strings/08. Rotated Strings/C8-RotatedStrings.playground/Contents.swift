import UIKit

// Write a function that returns a string with any
// consecutive spaces replaced with a single space.

func rotatedStrings(s1: String, s2: String) -> Bool {
    guard s1.sorted() == s2.sorted() else { return false }
    guard s1.count == s2.count else { return false }
    return (s1 + s1).contains(s2)
}

// Tests

assert(rotatedStrings(s1: "swift" , s2: "iftsw") == true)
assert(rotatedStrings(s1: "abcde" , s2: "eabcd") == true)
assert(rotatedStrings(s1: "abcde" , s2: "cdeab") == true)
assert(rotatedStrings(s1: "abcde" , s2: "abced") == false)
assert(rotatedStrings(s1: "abc", s2: "a") == false)

print("All tests passed.")
