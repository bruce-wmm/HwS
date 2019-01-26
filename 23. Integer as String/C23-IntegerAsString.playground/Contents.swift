import Foundation

// Write a function that accepts a string and returns true
// if it contains only numbers, i.e. the digits 0 through 9.

Int.min
Int.max
UInt.min
UInt.max
Double(Int.min)
Double(Int.max)

func integerAsString(input: String) -> Bool {
    guard Double(input) != nil else { return false }
    guard Double(input)! < Double(Int.max) else { return true }
    guard Int(input) != nil else { return false }
    
    return true
}

func integerAsString2(input: String) -> Bool {
    return input.rangeOfCharacter(from: CharacterSet(charactersIn: "0123456789").inverted) == nil // I think the "0123456789" character set needs to be smallest to largest because of how the searching algorithm works
}

// Tests

assert(integerAsString(input: "01010101") == true)
assert(integerAsString(input: "123456789") == true)
assert(integerAsString(input: "9223372036854775808") == true) // larger than Int allows
assert(integerAsString(input: "1.01") == false)

assert(integerAsString2(input: "01010101") == true)
assert(integerAsString2(input: "123456789") == true)
assert(integerAsString2(input: "9223372036854775808") == true) // larger than Int allows
assert(integerAsString2(input: "1.01") == false)

print("All tests passed.")
