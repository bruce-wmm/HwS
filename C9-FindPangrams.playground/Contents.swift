import UIKit

// Write a function that returns true if it is given a string
// that is an English pangram, ignoring letter case

// A pangram is a string that contains every letter of the alphabet at least once.

func findPangrams(input: String) -> Bool {
    
// Brute force solution:
//    for c in "abcdefghijklmnopqrstuvwxyz" {
//        guard input.contains(c) else { return false }
//    }
//    return true

    // Elegant solution:

    let set = Set(input.lowercased())
    let letters = set.filter { $0 >= "a" && $0 <= "z" }
    return letters.count == 26
}

// Tests

assert(findPangrams(input: "The quick brown fox jumps over the lazy dog") == true)
assert(findPangrams(input: "The quick brown fox jumped over the lazy dog") == false)

print("All tests passed.")
