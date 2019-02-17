import UIKit

// Write a function that accepts a string, and returns how many
// times a specific character appears, taking case into account.

func countCharacters1(input: String, char: Character) -> Int {
    var count = 0
    for c in input {
        if c == char {
            count += 1
        }
    }
    return count
}

func countCharacters2(input: String, char: Character) -> Int {
    return input.filter { $0 == char }.count
}

// Tests

assert(countCharacters1(input: "C3P0", char: "C") == 1)
assert(countCharacters1(input: "C3P0", char: "c") == 0)
assert(countCharacters1(input: "R2D2", char: "2") == 2)
assert(countCharacters1(input: "Mississippi", char: "i") == 4)
assert(countCharacters1(input: "Hacking with Swift", char: "i") == 3)

assert(countCharacters2(input: "C3P0", char: "C") == 1)
assert(countCharacters2(input: "C3P0", char: "c") == 0)
assert(countCharacters2(input: "R2D2", char: "2") == 2)
assert(countCharacters2(input: "Mississippi", char: "i") == 4)
assert(countCharacters2(input: "Hacking with Swift", char: "i") == 3)

print("All tests passed.")
