import UIKit

// Given a string in English, return a tuple containing the number of vowels and consonants.

func vowelsAndConsonants(input: String) -> (Int, Int) {
    let alphaInput = input.lowercased().filter { $0 >= "a" && $0 <= "z" }
    var vowels = 0
    
    for c in input {
        if "aeiou".contains(c) {
            vowels += 1
        }
    }
    return (vowels, alphaInput.count - vowels)
}

// Tests

assert(vowelsAndConsonants(input: "Swift Coding Challenges") == (6, 15))
assert(vowelsAndConsonants(input: "Mississippi") == (4, 7))

print("All tests passed.")
