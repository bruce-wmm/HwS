<p align="center"><img src="https://github.com/neilhiddink/HwS/blob/1aff6f6451bfbef908e80d071cde9f3f30158242/00.%20Resources/banner-100.png" width="500"></p>

## Day 9 Notes

[Summary - Structs](https://www.hackingwithswift.com/sixty/7/13/structs-summary)

<p align="center"><img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/01.%20Days%201-12/009.%20Structs%20(Part%202)/Tests/00.%20Day%209%20Progress%202-9-18.png" width="500"></p>

### Referring to the Current Instance

<img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/01.%20Days%201-12/009.%20Structs%20(Part%202)/Tests/02.%20Referring%20to%20the%20Current%20Instance%202-9-18.png" width="300">

#6 - Valid Swift - one of the stored properties is initialized when it is declared, so it doesn’t need to be in the `init()` method

#9 - The syntax is correct but the types are not. You cannot initialize a String with an Int value.

### Static Properties and Methods

<img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/01.%20Days%201-12/009.%20Structs%20(Part%202)/Tests/04.%20Static%20Properties%20and%20Methods%202-9-18.png" width="300">

#5 - Valid Swift - Uses the member-wise initializer to initialize `player` when instantiating a variable

#7 - Static member `population` cannot be used on instance of type `Person`

#8 - Instance member `ticketsUsed` cannot be used on type `Raffle`

#10 - Cannot use mutating member on immutable value: 'allCats' is a 'let' constant

### Access Control

<img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/01.%20Days%201-12/009.%20Structs%20(Part%202)/Tests/05.%20Access%20Control%202-9-18.png" width="300">

#2 - You retain the member-wise initializer, but due to the access control of `currentPatient` being private, you don’t get to use it, so it’s effectively negated and throws an error

#5 - `customerPrice` is a Double and `actualPrice` is an Int

#11 - If you only have private variables, you can use an empty constructor as a member-wise initializer

### 💡 New Concepts:

- You retain the member-wise initializer, but due to the access control of `currentPatient` being private, you don’t get to use it, so it’s effectively negated and throws an error
- If you only have private variables, you can use an empty constructor as a member-wise initializer
