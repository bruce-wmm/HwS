import UIKit

// Write a function that accepts a string of words with a similar prefix, separated
// by spaces, and returns the longest substring that prefixes all words.

func longestPrefix(input: String, delimiter: Character = " ") -> String {
    var words = input.split(separator: delimiter)
    var shortestWord = String(words.first!)
    for word in words {
        if let first = words.first?.count {
            if first <= word.count {
                continue
            } else {
                shortestWord = String(word)
            }
        }
    }
    
    for (i, var word) in words.enumerated() {
        repeat {
            word.popLast()
        } while word.count >= shortestWord.count
        words[i] = word
    }
    
    print(words)
    let prefix = String(words.first!)
    
    for i in 1...(words.count - 1) {
        if words[i].hasPrefix(prefix) {
            continue
        } else {
            words[i].popLast()
            print(words[i])
        }
    }
    print(words)
    return String(words.last!)
}

// Tests

assert(longestPrefix(input: "swift switch swill swim") == "swi")
assert(longestPrefix(input: "flip flap flop") == "fl")
assert(longestPrefix(input: "bing bang boom") == "b")

print("All tests passed.")
