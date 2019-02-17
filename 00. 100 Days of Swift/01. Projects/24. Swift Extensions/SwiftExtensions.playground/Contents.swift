import UIKit

// Extensions
// Note(s): A common naming scheme for naming your extension files is "Type+Modifier.swift"
//          Things that make sense as methods should be verbs, like trim() or trimmed()
//          Things that describe state should be properties, e.g. UIColor.blue
//          ExSwift - Open Source Supercharging of Swift's built-in data types (https://github.com/pNre/ExSwift)

// MARK: - Plus One Extension

extension Int {
    mutating func plusOne() {
        self += 1
    }
}

var myInt = 0

myInt += 1

myInt.plusOne()

myInt = 10
myInt.plusOne()
myInt

var otherInt = 10
otherInt.plusOne()

// MARK: - Squared Extension

//extension Int {
//    func squared() -> Int {
//        return self * self
//    }
//}
extension BinaryInteger {
    func squared() -> Self {
        return self * self
    }
}

let i: Int = 8
print(i.squared())
