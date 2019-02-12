 <p align="center"><img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/00.%20Resources/banner.png" width="500"></p>

## Day 11 Notes

[Summary - Protocols and Extensions](https://youtu.be/q1UkvM2V07E)

[Swift Language Guide - Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)

<p align="center"><img src="" width="500"></p>

### 

<img src="" width="300">

#X - 

### 💡 New Concepts:

- Classes cannot have multiple inheritance, but Protocols can.
- If you define a protocol instance method requirement that is intended to mutate instances of any type that adopts the protocol, mark the method with the `mutating` keyword as part of the protocol’s definition. This enables structures and enumerations to adopt the protocol and satisfy that method requirement. Remember that you don't need to add `mutating` when writing an implementation of that method for a class.
