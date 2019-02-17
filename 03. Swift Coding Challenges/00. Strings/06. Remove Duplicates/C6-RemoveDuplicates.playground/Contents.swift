import UIKit

// Write a function that accepts a string as its input, and
// returns the same string just with duplicate letters removed.

/**
 Brute force solution
 */
func removeDuplicates1(input: String) -> String {
    var output = ""
    for c in input {
        if output.contains(c) {
            continue
        } else {
            output += "\(c)"
        }
    }
    return output
}

/**
 Elegant solution
 */
func removeDuplicates2(input: String) -> String {
    var used = [Character: Bool]()
    let result = input.filter { used.updateValue(true, forKey: $0) == nil }
    return String(result)
}

// Tests

assert(removeDuplicates1(input: "Hacking with Swift") == "Hacking wthSf")
assert(removeDuplicates1(input: "wombat") == "wombat")
assert(removeDuplicates1(input: "hello") == "helo")
assert(removeDuplicates1(input: "Mississippi") == "Misp")

assert(removeDuplicates2(input: "Hacking with Swift") == "Hacking wthSf")
assert(removeDuplicates2(input: "wombat") == "wombat")
assert(removeDuplicates2(input: "hello") == "helo")
assert(removeDuplicates2(input: "Mississippi") == "Misp")

print("All tests passed.")
