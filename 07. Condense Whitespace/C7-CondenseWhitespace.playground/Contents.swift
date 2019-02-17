import UIKit

// Write a function that returns a string with any
// consecutive spaces replaced with a single space.

func condenseWhitespace(input: String) -> String {
    var spaceCounted = false
    var output = ""
    for c in input {
        if c == " " {
            if spaceCounted { continue }
            spaceCounted = true
        } else {
            spaceCounted = false
        }
        output.append(c)
    }
    return output
}

// Tests

assert(condenseWhitespace(input: "a   b   c") == "a b c")
assert(condenseWhitespace(input: "    a") == " a")
assert(condenseWhitespace(input: "abc") == "abc")

print("All tests passed.")
