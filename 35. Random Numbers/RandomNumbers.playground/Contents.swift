import UIKit

// Swift has built-in support for random numbers of various types
let int1 = Int.random(in: 0...10)
let int2 = Int.random(in: 0..<10)
let double1 = Double.random(in: 1000...10000)
let float1 = Float.random(in: -100...100)
let test = Bool.random() // randomly chooses true or false

// Old way - arc4random
// generates numbers between 0 and 4,294,967,295, giving a range of 2 to the power of 32 - 1
print(arc4random())
print(arc4random())
print(arc4random())
print(arc4random())

// Better way to generate random numbers in a range
print(arc4random_uniform(6))

// Multiple ranges at once is harder to accomplish...
func RandomInt(min: Int, max: Int) -> Int {
    if max < min { return min }
    return Int(arc4random_uniform(UInt32((max - min) + 1))) +
    min
}

// Generating random numbers with GameplayKit: GKRandomSource
import GameplayKit

// Some very specific reasons why this could not be random on Apple Documentation
print(GKRandomSource.sharedRandom().nextInt())

// In a range, identical to arc4random
print(GKRandomSource.sharedRandom().nextInt(upperBound: 6))


// GKARC4RandomSource and other GameplayKit options
let cong = GKLinearCongruentialRandomSource() // highest performance + lowest randomness
cong.nextInt(upperBound: 20)


let arc4 = GKARC4RandomSource() // balanced performance + balanced randomness
arc4.nextInt(upperBound: 20)

// If you need maximum randomness, use:
let mersenne = GKMersenneTwisterRandomSource() // lowest performance + highest randomness
mersenne.nextInt(upperBound: 20)

// NOTE: Dropping values by "force flushing" arc4random ensures unique sequences
// Apple suggests 769 values at a minimum
arc4.dropValues(1024)
