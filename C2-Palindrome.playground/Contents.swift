import UIKit

// Write a function that accepts a String as its only parameter and
// returns true if the string reads the same when reversed, ignoring case.

// Solution by Neil Hiddink on 1/3/19.

func checkPalindrome(word: String) -> Bool {
    return word.lowercased() == String(word.reversed()).lowercased()
}

// Tests

assert(checkPalindrome(word: "rotator") == true)
assert(checkPalindrome(word: "Rats live on no evil star") == true)
assert(checkPalindrome(word: "Never odd or even") == false)
assert(checkPalindrome(word: "Hello, world") == false)
print("All tests passed!")
