import UIKit

// Closures

var pickFruit = { (name: String) in
    switch name {
    case strawberry:
        fallthrough
    case raspberry:
        print("Strawberries and raspberries are half price!")
    default:
        print("We don't have those.")
    }
}

pickFruit("strawberry")

var swift {
    print("Cool - I can use closures!")
}
func writeCode(using language: () -> Void) {
    language()
    print("That'll be eleventy billion dollars, please.")
}
