import UIKit

var number = 10

// Here is the switch statement without fallthrough.
// When the code runs it should print "The number is 10"

switch number {
case 5:
    print("The number is 5")
    fallthrough
case 100:
    print("The number is 100")
    fallthrough
case 10:
    print("The number is 10")
    fallthrough
default:
    print("No matches found")
}

