import UIKit


// Write a function that accepts two strings, and returns true if they are identical in length but
// have no more than three different letters, taking case and string order into account.

func threeDifferentLetters(s1: String, s2: String) -> Bool {
    
    guard s1.count == s2.count else { return false }
    
    let one = s1.map { $0 }
    let two = s2.map { $0 }
    var differences = 0
    for (i, c) in one.enumerated() {
        if c == two[i] { continue }
        differences += 1
    }
    
    if differences > 3 {
        return false
    } else {
        return true
    }
}

// Tests

assert(threeDifferentLetters(s1: "Clamp", s2: "Cramp") == true)
assert(threeDifferentLetters(s1: "Clamp", s2: "Crams") == true)
assert(threeDifferentLetters(s1: "Clamp", s2: "Grams") == true)
assert(threeDifferentLetters(s1: "Clamp", s2: "Grans") == false)
assert(threeDifferentLetters(s1: "Clamp", s2: "Clam") == false)
assert(threeDifferentLetters(s1: "clamp", s2: "maple") == false)

print("All tests passed.")
