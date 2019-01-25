import Foundation

// Create a function that accepts an unsigned 8-bit integer and returns
// its binary reverse, padded so that it holds precisely eight binary digits.
// When you get the binary representation of a number, Swift will always use
// as few bits as possible – make sure you pad to eight binary digits before reversing.

// https://stackoverflow.com/questions/26181221/how-to-convert-a-decimal-number-to-binary-in-swift

func binaryReverse(input: UInt8) -> UInt {
    let binary = String(input, radix: 2)
    let paddingAmount = 8 - binary.count
    let paddedBinary = pad(string: binary, toSize: paddingAmount)
    let reversedBinary = String(paddedBinary.reversed())
    return UInt(reversedBinary, radix: 2)!
}

func pad(string: String, toSize: Int) -> String {
    return String(repeating: "0", count: toSize) + string
}

// Tests

assert(binaryReverse(input: 32) == 4)
assert(binaryReverse(input: 41) == 148)
assert(binaryReverse(input: 4) == 32)
assert(binaryReverse(input: 148) == 41)

print("All tests passed.")
