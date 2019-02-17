import UIKit

// Write your own version of the contains() method on String
// that ignores letter case, and without using the existing contains() method.

extension String {
//    Existing method
//    func contains(_ element: Character) -> Bool {
//        <#code#>
//    }
    func customContains(_ string: String) -> Bool {
        return self.uppercased().range(of: string.uppercased()) != nil
    }
}

let t1 = "Hello, world"
let t2 = "Hello, world"
let t3 = "Hello, world"

// Tests

assert(t1.customContains("Hello") == true)
assert(t1.customContains("WORLD") == true)
assert(t1.customContains("Goodbye") == false)

print("All tests passed.")
