import UIKit

// Structs - Part 2

// Initializers

struct Starship {
    var name: String
    var maxWarp: Double
    init(starshipName: String) {
        self.name = starshipName
        //        self.maxWarp = 0.0
    }
}
let voyager = Starship(starshipName: "Voyager")

// Static Properties and Methods

struct Amplifier {
    static let maximumVolume = 11
    var currentVolume: Int
}

struct Student {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let ed = Student(name: "Ed")
let taylor = Student(name: "Taylor")

struct Question {
    static let answer = 42
    var questionText = "Unknown"
    init(questionText: String, answer: String) {
        self.questionText = questionText
        self.answer = answer
    }
}

struct Person {
    static var population = 0
    var name: String
    init(personName: String) {
        name = personName
        population += 1
    }
}

struct Raffle {
    var ticketsUsed = 0
    var name: String
    var tickets: Int
    init(name: String, tickets: Int) {
        self.name = name
        self.tickets = tickets
        Raffle.ticketsUsed += tickets
    }
}

struct Cat {
    static let allCats = [Cat]()
    init() {
        Cat.allCats.append(self)
    }
    static func chorus() {
        for _ in allCats {
            print("Meow!")
        }
    }
}

// Access Control

struct SecretAgent {
    private var actualName: String
    public var codeName: String
    init(name: String, codeName: String) {
        self.actualName = name
        self.codeName = codeName
    }
}
let bond = SecretAgent(name: "James Bond", codeName: 007)

struct Doctor {
    var name: String
    var location: String
    static var currentPatient = "No one"
}
let drJones = Doctor(name: "Esther Jones", location: "Bristol")

struct FacebookUser {
    private var privatePosts: [String]
    //    public var publicPosts: [String]
    var publicPosts: [String]
}
let user = FacebookUser()

struct Contributor {
    private var name = "Anonymous"
    var age: Int
}
let paul = Contributor(age: 10)
