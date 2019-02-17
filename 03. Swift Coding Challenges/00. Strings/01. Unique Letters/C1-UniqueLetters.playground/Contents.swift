import UIKit

// Write a function that accepts a String as its only parameter, and returns
// true if the string has only unique letters, taking letter case into account.

func uniqueLetters(input: String) -> Bool {

//    BRUTE FORCE SOLUTION
//    var tally = [Character]()
//
//    for c in input {
//        guard !tally.contains(c) else { return false }
//        tally.append(c)
//    }
//
//    return true
    
    // ⭐️ Better Solution:
    
    return Set(input).count == input.count // returns true if there are no duplicates
    
}

// Test Cases

assert(uniqueLetters(input: "No duplicates") == true, "TEST FAILED")
assert(uniqueLetters(input: "abcdefghijklmnopqrstuvwxyz") == true, "TEST FAILED")
assert(uniqueLetters(input: "AaBbCc") == true, "TEST FAILED")
assert(uniqueLetters(input: "Hello, world") == false, "TEST FAILED")
print("SUCCESS")
