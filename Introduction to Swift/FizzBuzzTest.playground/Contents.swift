//
// FizzBuzzTest.playground
//
// Created by Neil Hiddink on 7/31/18.
// Copyright © 2018 Neil Hiddink. All rights reserved.
//

// Fizz Buzz Test - Instructions
//    Write a function that accepts an integer as input and returns a string
//    If the integer is evenly divisible by 3, return the string “Fizz”
//    If the integer is evenly divisible by 5, return the string “Buzz”
//    If the integer is evenly divisible by 3 and 5, return the string “Fizz Buzz”
//    For all other numbers, the function should return the input number

import Foundation

func convertInt(toString int: Int) -> String {
    
    if int % 3 == 0 && int % 5 == 0 {
        return "Fizz Buzz"
    } else if int % 3 == 0 {
        return "Fizz"
    } else if int % 5 == 0 {
        return "Buzz"
    }
    
    return String(int)
}

// MARK: Test Cases

convertInt(toString: 3)
convertInt(toString: 5)
convertInt(toString: 15)
convertInt(toString: 16)
