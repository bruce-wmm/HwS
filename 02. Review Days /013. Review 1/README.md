 <p align="center"><img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/00.%20Resources/banner.png" width="500"></p>

## Day 13 Notes (Review Day 1)

#### 📚 Consolidation days help you:
1. Same concepts; different approach.
2. Spaced Repetition System (SRS) - return to a topic over time to increase long-term memory
3. Additional context now helps you fill in gaps in your understanding
4. Show you how far you've come.

#### 0️⃣ Variables and Constants

Storing data is important for any computer program. There are two ways to store data in Swift.

- `let` declares a constant
- `var` declares a variable

Use constants wherever possible

You cannot reuse names for variables and/or constants.

#### 1️⃣ Types of Data

Swift can infer the type of data when creating a variable or constant:

```swift
var name = "Neil" // Swift knows name is of type String
```

It's preferable to create and assign values on the same line and to use type inference where possible.

Variables and constants do not start with a capital letter, but data types do.

Swift will not let you mix up data types.

Float and Double handle numbers with decimal values. Double has **2x** the accuracy of Float, hence the name.

Booleans only have two values - `true` or `false`

#### 2️⃣ Operators

**[Swift Standard Library - Operator Declarations](https://developer.apple.com/documentation/swift/swift_standard_library/operator_declarations)**

Basic operators include: `+` `-` `*` `/` `=`

These can be combined into operators such as `+=`, which means "add together, then set equal to"

`%` returns the remainder of the expression and is called modulus.

Comparison operators such as `<`,  `>=`, and `==` return Booleans.

A variable or condition with `!` in front of it means "not".

#### 3️⃣ String Interpolation

String interpolation = combining variables and constants inside of a string

```swift
var name = "Neil"
"His name is \(name)"
```

String interpolation is more efficient than adding strings.

Anything inside of the `\()` of a string interpolation can be a full Swift expression.

#### 4️⃣ Arrays

Organize values together into a single collection so that you can easily access them later based on their position.

Start counting array indices at zero.

`type(of:)` prints out the type of any variable or constant

`[Any]` creates an array that can hold any type

Arrays are created using either:

```swift
var myArray: [String] = []
```

or 

```swift
var myArray = [String]()
```

The generic structure `Array` contains several static functions that allow you to add two collections together, a collection and a sequence, etc. See [Array](https://developer.apple.com/documentation/swift/array) for more information.

#### 5️⃣ Dictionaries

Values are accessed using a key you specify.

You can store a wide variety of values inside dictionaries, although the keys are normally of type `String`.

#### 6️⃣ Conditional Statements

To boost performance when evaluating multiple conditions simultaneously, Swift uses [short-circuit evaluation](https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html).

#### 7️⃣ Loops

Computers are great at doing boring tasks repetitively.

`print()` prints out to the console

Closed Range Operator is `...`

Use an underscore if you don't need to know the index of the loop:

```swift
var output = "Hello, World!"

for _ in 1...4 {
    output.removeLast()
}

print(output) // prints "Hello, Wo"
```

Loops can be nested

`while` loops are best used when you're using unknown data, such as downloading things from the internet, reading from a file such as XML, looking through user input, etc.

`continue` immediately jumps to the next iteration of the loop

`break` exits the current loop

Loops can be labeled, which is useful when trying to break out of a specific loop.

#### 8️⃣ Switch Statements

One advantage to `switch/case` is that Swift will ensure your cases are exhaustive.

`break` isn't required in Swift case blocks

`fallthrough` overrides the short-circuit default behavior and executes the next available `case`

#### ✅ Tests

[Hacking With Swift - Review Your Learning](https://www.hackingwithswift.com/review)
