//
// IntroductionToSwift.playground
//
// Created by Neil Hiddink on 7/31/18.
// Copyright © 2018 Neil Hiddink. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Constants and Variables

let color = UIColor.red
var sum = 15

// MARK: - Data Types

let integer: Int = 3
let float: Float = 1.1
let double: Double = 12.0
var string: String = "String"
var test: Bool = false

// MARK: - Operators

sum += 3
sum -= 3
sum *= 3
sum /= 3
sum % 2
sum == 0

string += " String 2"

// MARK: - String Interpolation

string = "\(integer)"

// MARK: - Arrays and Dictionaries

let array = [Int]()
let dictionary = [String: Int]()

// MARK: - Conditional Statements

if 5 * 2 == 10 {
    print("YES")
}

// MARK: _ Control Flow

for _ in 0...2 {
    print("Hello, World!")
}

// MARK: - Functions and Methods

func convertInt(toString int: Int) -> String {
    if int % 2 == 0 {
        return "Even"
    }
    return "Odd"
}
convertInt(toString: 3)
convertInt(toString: 5)
convertInt(toString: 15)
convertInt(toString: 16)

// MARK: - Optionals

var maybe: Int? = 0
print(maybe ?? 0)
if let maybe = maybe {
    print("Successfully unwrapped optional: \(maybe)")
}

// MARK: - Enumerations

enum Animals: Int {
    case lions = 0, tigers, bears
}

print(Animals.bears.rawValue)

// MARK: - Classes and Structures

class Building: NSObject {
    
    let height = 2000
    let sqFeet = 10000
    let occupancy = 500
}

struct PhysicsCategory {
    static let none:    UInt32 = 0      // 0
    static let player:  UInt32 = 0b1    // 1
    static let enemy:   UInt32 = 0b10   // 2
    static let wall:    UInt32 = 0b100  // 4
}

// MARK: - Property Observers

var observer = 0 {
    didSet {
        observer += 1
    }
}

observer = 2
print(observer) // prints 3

// MARK: - Access Control

private var secret = "This is a secret message"

// MARK: - Typecasting
var value: Int? = 25
let output = value as! Int
print(output)

// MARK: - Closures

func test (closure: (String) -> Void) {
    print("Hello, World!")
    closure("Call Closure")
}

// Standard Syntax
test(closure: { str in
    print(str)
})

// Trailing Syntax
test { str in
    print(str)
}

