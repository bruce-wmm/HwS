import UIKit

// Classes

class Image {
    var filename1: String
    var isAnimated: Bool
    init(filename: String, isAnimated: Bool) {
        filename1 = filename
        self.isAnimated = isAnimated
    }
}

// Inheritance

class Computer {
    var cpu: String
    var ramGB: Int
    init(cpu: String, ramGB: Int) {
        cpu = cpu
        ramGB = ramGB
    }
}
class Laptop: Computer {
    var screenInches: Int
    init(screenInches: Int, cpu: String, ramGB: Int) {
        self.screenInches = screenInches
        super.init(cpu: cpu, ramGB: ramGB)
    }
}

class SmartPhone {
    var price: Int
    init(price: Int) {
        self.price = price
    }
}
class SmartPhone: SmartPhone {
    var features: [String]
    init(features: [String]) {
        self.features = features
        super.init(price: features.count * 50)
    }
}

// Mutability

struct Park {
    var numberOfFlowers = 1000
    func plantFlowers() {
        numberOfFlowers += 50
    }
}
let park = Park()
park.plantFlowers()
