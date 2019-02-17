import UIKit

// Protocols and Extensions

protocol Swimmable {
    var depth { get }
}

// Protocol Inheritance

protocol Scoreable {
    func add
}
protocol Winnable {
    func makeWinningSpeech
}
protocol Competitor: Scoreable, Winnable { }

protocol Buyable {
    var cost: Int
}
protocol Sellable {
    func findBuyers() -> [String]
}
protocol FineArt: Buyable, Sellable { }

protocol Readable {
    func read() -> String
}
protocol Writeable {
    func write(string: String)
}
protocol NetworkSocket: Readable, Writeable

// Extensions

extension String {
    func append(_ other: String) {
        self += other
    }
}

extension Int {
    times(_ action: () -> Void) {
    for _ in 0..<self {
    action()
    }
    }
}

// Protocol Extensions

protocol SmartPhone {
    func makeCall(to name: String)
}
extension SmartPhone {
    func makeCall(to name: String) {
        print("Dialling \(name)...")
    }
}

// Summary - Protocols and Extensions

// In this example, the mutating keyword is required even if you're just calling a class because age is an Int, which is a Struct and Struct's self property is immutable by default
protocol HasAge {
    var age: Int { get set }
    mutating func celebrateBirthday()
}

class Man: HasAge {
    var age = 50
    
    func celebrateBirthday() {
        age += 1
    }
}

struct Dog: HasAge {
    var age = 1
    
    func celebrateBirthday() {
        age *= 7
    }
}

// Here the mutating isn't doing anything, so it works to
// add mutating or remove it from in front of the extension's implementation of refillAir()
protocol Inflatable {
    mutating func refillAir()
}
extension Inflatable {
    func refillAir() {
        print("Refilling the air.")
    }
}
