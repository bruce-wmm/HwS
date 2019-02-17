import Foundation

// Given a string that contains both letters and numbers, write
// a function that pulls out all the numbers then returns their sum.

func addNumbersInString(input: String) -> Int {
    let numberString = input.filter { "0123456789".contains($0) }.replacingOccurrences(of: "0", with: "0 ")
    
    guard numberString.contains("0") else {
        var sum = 0
        for c in numberString {
            sum += Int("\(c)")!
        }
        return sum
    }
    
    let numberArray = numberString.split(separator: " ")
    print(numberArray)
    var sum = 0
    for n in numberArray {
        if let number = Int(n) {
            sum += number
        }
    }
    return sum
}

// Tests

assert(addNumbersInString(input: "a1b2c3") == 6)
assert(addNumbersInString(input: "a10b20c30") == 60)
assert(addNumbersInString(input: "h8ers") == 8)

print("All tests passed.")
