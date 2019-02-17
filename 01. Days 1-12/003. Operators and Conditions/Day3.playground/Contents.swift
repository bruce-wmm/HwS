import UIKit

// OPERATORS AND CONDITIONS

// Arithmetic Operators

let first = 9
let second = 7

let sum = first + second
let difference = first - second
let product = first * second
let quotient = first / second
let remainder = first % second

// These operators can be overloaded, but make sure you operate on a consistent type!

// Comparison operators also work on strings (alphabetical order):

let taylor = "Taylor"
let swift = "Swift"

if taylor < swift {
    print("Condition passed")
} else {
    print("Condition failed")
}

// Switch statement with the fallthrough keyword. Unlike C and Objective-C, Swift's switch
// statements are safety conscious. They will exit on the first case that matches the given
// condition(s).

var number = 10

switch number {
case 5:
    print("The number is 5")
    fallthrough
case 100:
    print("The number is 100")
    fallthrough
case 10:
    print("The number is 10")
    fallthrough
default:
    print("No matches found")
}

