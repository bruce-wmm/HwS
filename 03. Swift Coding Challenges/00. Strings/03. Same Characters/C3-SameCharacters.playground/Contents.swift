import UIKit

// Write a function that accepts two String parameters and
// returns true if they contain the same characters in any
// order taking into account letter case.

// Solution by Neil Hiddink on 1/3/19.

func checkSameCharacters(s1: String, s2: String) -> Bool {
    
//    guard Set(s1) == Set(s2) else { return false }
//    guard s1.count == s2.count else { return false }
    guard s1.sorted() == s2.sorted() else { return false }
    
    return true
}


// MARK: - Tests

assert(checkSameCharacters(s1: "abca", s2: "abca") == true)
assert(checkSameCharacters(s1: "abc", s2: "cba") == true)
assert(checkSameCharacters(s1: "a1 b2", s2: "b1 a2") == true)
assert(checkSameCharacters(s1: "abc", s2: "abca") == false)
assert(checkSameCharacters(s1: "abc", s2: "Abc") == false)
assert(checkSameCharacters(s1: "abc", s2: "cbAa") == false)
assert(checkSameCharacters(s1: "abcc", s2: "abca") == false)

print("All tests passed!")
