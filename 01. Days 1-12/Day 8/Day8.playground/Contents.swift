import UIKit

// Structs - Part 1

struct Person {
    var name: String
    
//    mutating func makeAnonymous() {
//        name = "Anonymous"
//    }
}

var person = Person(name: "Ed")
person.name = "Neil"
//person.makeAnonymous()
person.name

struct Sunglasses {
    var protectionLevel: Int
    var visionTest: String {
        if protectionLevel < 3 {
            return "These aren't very dark"
        } else if protectionLevel < 6 {
            return "These are just right"
        } else if protectionLevel < 10 {
            return "Who turned the lights out?"
        } else { return "" }
    }
}

struct Race {
    var distance: Int
    var runners = 0
    var description: String {
        return "This is a \(distance)km race with \(runners) runners."
    }
}
let londonMarathon = Race(distance: 42, runners: 40_000)

struct Candle {
    var burnLength: Int
    var alreadyBurned = 0
    let burnRemaining: Int {
        return burnLength - alreadyBurned
    }
}

struct Code {
    var language: String
    var containsErrors = false
    var report {
        if containsErrors {
            return "This \(language) code has bugs!"
        } else {
            return "This looks good to me."
        }
    }
}

struct Keyboard {
    var isMechanical = false
    var noiseLevel: Int {
        if isMechanical {
            return 11
        } else {
            return 3
        }
    }
}
let majestouch = Keyboard(isMechanical: true, noiseLevel: 0)
print(majestouch.noiseLevel)


struct Dog {
    var age {
        didSet {
            let dogAge = age * 7
            print("I'm now \(dogAge) in dog years.")
        }
    }
}

struct Car {
    let mileage: Int
    mutating func drive(distance: Int) {
        mileage += distance
    }
}

struct Switch {
    var isOn: Bool
    mutating func toggle {
        if isOn {
            isOn == false
        } else {
            isOn == true
        }
    }
}

var examScores = [100, 95, 92]
examScores.insert(98)
