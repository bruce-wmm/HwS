 <p align="center"><img src="https://github.com/neilhiddink/HwS/blob/1aff6f6451bfbef908e80d071cde9f3f30158242/00.%20Resources/banner-100.png" width="500"></p>

## Day 15 Notes (Review Day 3)

#### 0️⃣ Properties

Allow you to attach values to your complex types such as Structs and Classes.

There are two kinds of property observer in Swift: `willSet` and `didSet`, called before or after a property is changed, respectively.

Properties can be declared as computed properties using `get` and `set` inside a closure. Useful when you want some action to happen at the appropriate time.

#### 1️⃣ Static Properties and Methods

The `static` keyword is used to create properties and methods that belong to a type, rather than to instances of a type.

Access these properties using:

```swift
Type.property
```

#### 2️⃣ Access Control

[Swift Programming Language - Access Control](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html)

- `public` - everyone can read and write
- `internal` - only your Swift code can read and write, not frameworks
- `fileprivate` - (rarely used) only Swift code in the same file as the type can read and write
- `private` - most restrictive option, and means the property is available only inside methods that belong to the type, or its extensions.

#### 3️⃣ Polymorphism and Typecasting

[Hacking With Swift - Polymorphism and Typecasting](https://www.hackingwithswift.com/read/0/20/polymorphism-and-typecasting)

Inheritance ensures classes are super- or sub- sets of each other. [Polymorphism](https://medium.com/devslopes-blog/learning-swift-and-ios-development-part-12-polymorphism-16ef5925708d) allows objects to act as its class and its parent classes, all at the same time.

❗️**Multiple Inheritance has unique rules in Swift.** Multiple inheritance is a standard feature of some programming languages, like C++; this is not the case for Swift. In Swift:
- A  class can conform to multiple protocols, but inherit from only one class
- Value types, such as struct and enum, can conform to multiple protocols only

Due to polymorphism, there are times when Swift will not allow you to access the Type you are expecting, such as when you are organizing classes based on their superclass into an array. To access the properties in each value of the array (aka, the subclass) you need to use **typecasting**.

Typecasting in Swift comes in three forms, but most of the time you'll only meet two: `as?` and `as!`, known as **optional downcasting** and **forced downcasting**.
- `as?` translates to "I think this conversion might be true, but it might fail"
- `as!` translates to "I know this conversion is true, and I'm happy for my app to crash if I'm wrong"

When typecasting, use `if let` syntax to safely unwrap into a constant that can then access the properties you want.


#### 4️⃣ Closures

Closures can be thought of as "variables that hold code"

Closures capture the scope where they are created, which means they take a copy of the values that are used inside them.

[Automatic Reference Counting](https://docs.swift.org/swift-book/LanguageGuide/AutomaticReferenceCounting.html) - With Swift, ARC automatically frees up the memory used by class instances when those instances are no longer needed.

Trailing closure syntax is preferred.

#### ✅ Tests

[Hacking With Swift - Review Your Learning](https://www.hackingwithswift.com/review)
