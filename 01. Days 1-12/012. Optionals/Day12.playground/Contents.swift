import UIKit

// Optionals

var bestScore: Int? = nil
bestScore = 101
if bestScore > 100 {
    print("You got a high score!")
} else {
    print("Better luck next time.")
}

var score: Int = nil
score = 556
if let playerScore = score {
    print("You scored \(playerScore) points.")
}

let tableHeight: Double? = 100
if tableHeight > 85.0 {
    print("The table is too high.")
}

let favoriteTennisPlayer: String? = "Andy Murray"
if let player {
    print("Let's watch \(player)'s highlights video on YouTube.")
}

var weatherForecast: String = "sunny"
if let forecast = weatherForecast {
    print("The forecast is \(forecast).")
} else {
    print("No forecast available.")
}

let menuItems: [String]? = ["Pizza", "Pasta"]
if let items = menuItems {
    print("There are \(menuItems.count) items to choose from.")
}

// Unwrapping with Guard

func plantTree(_ type: String?) {
    guard let type else {
        return
    }
    print("Planting a \(type).")
}
plantTree("willow")

// Nil Coalescing

let painter: String = "Leonardo da Vinci"
var artist: String = painter ?? "Unknown"

var bestPony: String? = "Pinkie Pie"
let selectedPony: String? == bestPony ?? nil

// Optional Chaining

let attendees: [String] = [String]()
let firstInLine = attendees?.first?.uppercased()

let shoppingList = ["eggs", "tomatoes", "grapes"]
let firstItem = shoppingList.first?.appending(" are on my shopping list")

let names = ["Taylor", "Paul", "Adele"]
let lengthOfLast = names.last?.count?

// Typecasting

class Glasses {
    var isShortSighted = true
}
struct Sunglasses: Glasses { }
let shades = Sunglasses()
if let glasses = shades as? Glasses {
    if glasses.isShortSighted {
        print("These sunglasses are for shortsighted people.")
    } else {
        print("These sunglasses are for longsighted people.")
    }
}

let distances = [23, 28, 22]
if let stringDistances = distances as [Int] {
    for distance in stringDistances {
        print("The distance was \(distance).")
    }
}

class Sport { }
class Swimming: Sport {
    var distance = 100
}
let swimming = Sport()
if let sport as? Swimming {
    print("The distance is \(sport.distance).")
}

// Summary - Optionals

let names = ["John", "Paul", "George", "Ringo"]
let upperRingo = names.last.uppercased()

let birthYear: Int? = nil
let year = birthYear ?? "Unknown"

func brewBeer(to strength: Double?) {
    guard let strength = strength else { return }
    print("Let's brew some beer!")
}
brewBeer(to: 5.5)
