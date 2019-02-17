import UIKit

// Write a function that accepts a string as input, then returns how often
// each letter is repeated in a single run, taking case into account.

func runLengthEncoding(input: String) -> String {
    var currentLetter: Character?
    var counter = 0
    var output = ""
    
    for letter in input {
        if letter == currentLetter {
            counter += 1
        } else {
            if let current = currentLetter {
                output.append("\(current)\(counter)")
            }
            currentLetter = letter
            counter = 1
        }
    }
    
    if let current = currentLetter {
        output.append("\(current)\(counter)")
    }
    
    return output
}

// Tests

assert(runLengthEncoding(input: "aabbcc") == "a2b2c2")
assert(runLengthEncoding(input: "aaabaaabaaa") == "a3b1a3b1a3")
assert(runLengthEncoding(input: "aaAAaa") == "a2A2a2")

print("All tests passed.")
