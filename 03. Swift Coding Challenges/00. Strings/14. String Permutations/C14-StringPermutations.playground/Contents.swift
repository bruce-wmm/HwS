import UIKit

// Write a function that prints all possible permutations of a given input string.

func printAllPermutations(input: String) -> String {
    
    return ""
}

// Tests

assert(printAllPermutations(input: "a") == "a")
assert(printAllPermutations(input: "ab") == "ab" || printAllPermutations(input: "ab") == "ba")
assert(printAllPermutations(input: "abc") == "abc" ||
        printAllPermutations(input: "ab") == "acb" ||
        printAllPermutations(input: "ab") == "bac" ||
        printAllPermutations(input: "ab") == "bca" ||
        printAllPermutations(input: "ab") == "cab" ||
        printAllPermutations(input: "ab") == "cba")

print("All tests passed.")
