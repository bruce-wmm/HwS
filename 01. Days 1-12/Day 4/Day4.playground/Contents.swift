import UIKit

var number: Int = 10
while number > 0 {
    number -= 2
    if number % 2 == 0 {
        print("\(number) is an even number.")
    }
}

0 % 2

var cats: Int = 0
var textArray = [String]()
while cats < 10 {
    cats += 1
    print("I'm getting another cat.")
    textArray.append("I'm getting another cat.")
    if cats == 4 {
        print("Enough cats!")
        textArray.append("Enough cats!")
        cats = 10
    }
}

print(textArray.count)

var frogs = 4
repeat {
    for _ in 1...frogs {
        print("Ribbit!")
    }
} while false // repeat runs the loop at least once

var passengerNumber = 0
while passengerNumber < 30 {
    passengerNumber += 1
    if passengerNumber == 13 {
        print("Let's skip the unlucky one.")
        continue
    }
    print("Now boarding passenger \(passengerNumber)")
}

var hoursStudied = 0
var goal = 10
repeat {
    hoursStudied += 1
    if hoursStudied > 4 {
        goal -= 1
        continue
    }
    print("I've studied for \(hoursStudied) hours")
} while hoursStudied < goal
