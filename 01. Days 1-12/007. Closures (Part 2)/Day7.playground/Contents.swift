import UIKit

// Closures - Part 2

func createInterface(positioning: ([String]) -> Void) {
    print("Creating some buttons")
    let buttons = [
        "Button 1"
        "Button 2"
        "Button 3"
    ]
    positioning(buttons)
}
createInterface { (buttons: [String]) in
    for button in buttons {
        print("I'll place \(button) here...")
    }
}

func bakeCookies(number: Int, secretIngredient: () -> String) {
    for _ in 0..<number {
        print("Adding butter...")
        print("Adding flour...")
        print("Adding sugar...")
        print("Adding egg...")
        let extra = secretIngredient()
        print(extra)
    }
}
bakeCookies(5) {
    return "Adding vanilla extract"
}

func goShopping(for item: String, decisionHandler: (String) -> Bool) {
    print("I'm going to buy \(item)")
    if decisionHandler() == true {
        print("Great! I bought them.")
    } else {
        print("Maybe next time...")
    }
}
goShopping(for: "shoes") { item in
    if item == "shoes" {
        return false
    } else {
        return true
    }
}

func activateAI(ai: () -> String) {
    print("Let's see what this thing can do...")
    let result = ai()
    print(result)
}
activateAI {
    return "Come with me if you want to live."
}
