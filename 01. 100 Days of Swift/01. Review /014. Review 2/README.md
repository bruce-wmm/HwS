 <p align="center"><img src="https://github.com/neilhiddink/HwS/blob/1aff6f6451bfbef908e80d071cde9f3f30158242/00.%20Resources/banner-100.png" width="500"></p>

## Day 14 Notes (Review Day 2)

#### 0️⃣ Functions

[Functions - Swift Standard Library](https://docs.swift.org/swift-book/LanguageGuide/Functions.html)

Functions let you define re-usable pieces of code that perform specific tasks.

```swift
func chooseColor() {
    print("Choose a color")
}

chooseColor() // prints "Choose a color"
```

Some things you can do with functions:
- Accept parameters inside of the `()`, labeled with `_:` where the underscore is an empty label, can be any name and should start with a lowercase letter. See [Omitting Argument Labels](https://docs.swift.org/swift-book/LanguageGuide/Functions.html#ID166) for more information.
- Return a value using `->`
- Use the `throws` keyword to make the function throw an error that conforms to the `Error` protocol

#### 1️⃣ Optionals

Swift is a type safe language. To handle values that may be `nil`, declare an optional with the `?` postfix operator.

Force unwrapping uses the `!` postfix operator. This can also be used when declaring variables to create implicitly unwrapped optional values.

In general, you want to avoid using `!` whenever possible, as it may crash your code.

#### 2️⃣ Optional Chaining

Lets you run code only if your optional has a value.

The nil coalescing operator `??` provides a default value if the value is nil

#### 3️⃣ Enumerations

- A way to define your own kind of value in Swift. Makes it easy to access, pairs well with switch statements
- Can have values attached to them that you define (associated values)

#### 4️⃣ Structs

Structs are complex data types, made up of multiple values.

Structs **automatically** get a memberwise initializer:

```swift
struct Person {
    var clothes: String
    var shoes: String
}
let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")
```

Struct properties are immutable. Use `mutating` on the struct's methods to allow mutability.

#### 5️⃣ Classes

- Classes don't get an automatic memberwise initializer
- Classes have inheritance
- When you create an instance of a class it’s called an object. If you copy that object, both copies point at the same data by default (reference type)

Initializers don't use the `func` keyword

[Object-oriented programming in Swift](https://www.raywenderlich.com/599-object-oriented-programming-in-swift)

If you want to have some part of Apple’s operating system call your Swift class’s method, you need to mark it with a special attribute: @objc.

Swift calls structs "value types" because they just point at a value, and classes "reference types" because objects are just shared references to the real value.
- Use **classes** for one shared state that gets passed around and modified in place.
- Use **structs** to avoid shared state where one copy can't affect all the others.

To summarize, the key difference between structs and classes is classes offer more flexibility, whereas structs offer more safety. As a basic rule, you should always use structs until you have a specific reason to use classes.

#### ✅ Tests

[Hacking With Swift - Review Your Learning](https://www.hackingwithswift.com/review)
