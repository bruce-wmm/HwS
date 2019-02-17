import UIKit

// Write a function that counts from 1 through 100, and prints “Fizz” if the counter
// is evenly divisible by 3, “Buzz” if it’s evenly divisible by 5, “Fizz Buzz” if it’s
// even divisible by three and five, or the counter number for all other cases.

func fizzBuzz() {
    var test: (Bool, Bool) = (false, false)
    for i in 1...100 {
        test = (i % 3 == 0, i % 5 == 0)
        switch test {
        case (true, false):
            print("Fizz")
        case (false, true):
            print("Buzz")
        case (true, true):
            print("Fizz Buzz")
        default:
            print("\(i)")
        }
    }
}

fizzBuzz()
