 <p align="center"><img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/00.%20Resources/banner.png" width="500"></p>

## Day 10 Notes

[Swift Docs - Structures and Classes](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html)

[Summary - Classes](https://youtu.be/wF1ovHy2KO8)

```
Structures and classes are general-purpose, flexible constructs that become the building blocks of your program’s code.
```

### Differences between Classes and Structs

1. Classes never come with a memberwise initializer.
2. Classes have inheritance.
3. Classes are copied as reference types, not value types.
4. Classes can have deinitializers.
5. Classes are mutable.

<p align="center"><img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/01.%20Days%201-12/010.%20Classes/Tests/00.%20Day%2010%20Progress%202-10-19.png" width="500"></p>

### Creating Your Own Classes

<img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/01.%20Days%201-12/010.%20Classes/Tests/01.%20Creating%20Your%20Own%20Classes%202-10-19.png" width="300">

#7 - `func` keyword is not used for initializers

#11 - Swift cannot tell in this case whether or not you’re assigning to the property of the class or the parameter of the initializer.

### Class Inheritance

<img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/01.%20Days%201-12/010.%20Classes/Tests/02.%20Class%20Inheritance%202-10-19.png" width="300">

#9 - The `SmartPhone` class name can only be used once

### Copying Objects

<img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/01.%20Days%201-12/010.%20Classes/Tests/05.%20Copying%20Objects%202-10-19.png" width="300">

#8 - Same Output Twice - only one instance of the class

### 💡 New Concepts:

- Deinitializers are only available for `Class` types.
- Mutability - variable properties inside of constant Classes can change, where in Structs they cannot.
- Structs don't have inheritance
