import UIKit

// Write a function that accepts positive minimum and maximum integers,
// and returns a random number between those two bounds, inclusive.

func randomNumberRange(min: Int, max: Int) -> Int {
    return Int.random(in: min...max)
    // Alternatively, you can use arc4random_uniform, which is not restricted to Apple platforms
    // Note that:
    // 1. The range is generated from 0 to an upper bound. You need to do some math to shift by the minimum.
    // 2. The upper bound is EXCLUDED. Make sure to add one to isolate the range you want.
    // 3. The parameter accepted is a UInt32 instead of an Int, so you need to typecast to Int.
    // return Int(arc4random_uniform(UInt32(max - min + 1))) + min
}

// Tests
let test1 = randomNumberRange(min: 1, max: 5)
assert((test1 >= 1, test1 <= 5) == (true, true))

let test2 = randomNumberRange(min: 8, max: 10)
assert((test2 >= 8, test2 <= 10) == (true, true))

let test3 = randomNumberRange(min: 12, max: 12)
assert((test3 >= 12, test3 <= 12) == (true, true))

let test4 = randomNumberRange(min: 7, max: 7)
assert((test4 >= 12, test4 <= 18) == (false, true))

print("All tests passed.")
