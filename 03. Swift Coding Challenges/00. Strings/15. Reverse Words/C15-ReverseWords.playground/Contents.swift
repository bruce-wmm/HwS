import UIKit

// Write a function that returns a string with each of its words
// reversed but in the original order, without using a loop.

func reverseWords(input: String) -> String {
    let words = input.components(separatedBy: " ").map { String($0.reversed()) }
    return words.reduce(into: "") { result, word in
        if words.last == word {
            result += "\(word)"
        } else {
            result += "\(word) "
        }
    }
}

// print(reverseWords(input: "Swift Coding Challenges"))

assert(reverseWords(input: "Swift Coding Challenges") == "tfiwS gnidoC segnellahC")
assert(reverseWords(input: "The quick brown fox") == "ehT kciuq nworb xof")

print("All tests passed.")
