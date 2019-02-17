 <p align="center"><img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/00.%20Resources/banner.png" width="500"></p>

## Day 11 Notes

[Summary - Protocols and Extensions](https://youtu.be/q1UkvM2V07E)

[Swift Language Guide - Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)

<p align="center"><img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/01.%20Days%201-12/011.%20Protocols%20and%20Extensions/Tests/00.%20Day%2011%20Progress%202-11-19.png" width="500"></p>

### Extensions

<img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/01.%20Days%201-12/011.%20Protocols%20and%20Extensions/Tests/03.%20Extensions%202-11-19.png" width="300">

#7 - Missing `func` keyword

### Protocol Extensions

<img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/01.%20Days%201-12/011.%20Protocols%20and%20Extensions/Tests/04.%20Protocol%20Extensions%202-11-19.png" width="300">

#1 - `writeScript` is different from `makeScript` pay attention to the question.

### Summary - Protocols and Extensions

<img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/01.%20Days%201-12/011.%20Protocols%20and%20Extensions/Tests/06.%20Protocols%20and%20Extensions%20-%20Summary%202-11-19.png" width="300">

#3 - Valid Swift - the `mutating` keyword is not mandatory in this case, but if you were to expand the implementation in the future you’d want it in case you’re dealing with value types such as Structs or Enumerations.

### 💡 New Concepts:

- Classes cannot have multiple inheritance, but Protocols can.
- If you define a protocol instance method requirement that is intended to mutate instances of any type that adopts the protocol, mark the method with the `mutating` keyword as part of the protocol’s definition. This enables structures and enumerations to adopt the protocol and satisfy that method requirement. Remember that you don't need to add `mutating` when writing an implementation of that method for a class.
