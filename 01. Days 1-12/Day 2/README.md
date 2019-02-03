<p align="center"><img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/00.%20Resources/banner.png" width="500"></p>

## Day 2 Notes

[Summary - Complex Types](https://youtu.be/4dKDADbQtXY)

<p align="center"><img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/01.%20Days%201-12/Day%202/Tests/00.%20Day%202%20Progress%202-2-19.png" width="500"></p>

### Sets

<img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/01.%20Days%201-12/Day%202/Tests/02.%20Sets%202-2-19.png" width="300">

I got 11/12 because I forgot about the shorthand rule for Sets. [Unlike arrays, sets do not have an equivalent shorthand form.](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html)

❌:
```swift
let mySet = Set(1, 1, 2, 3, 4)
```

✅:
```swift
let mySet = Set([1, 1, 2, 3, 4])
```

[Arrays vs Sets vs Tuples – Swift in Sixty Seconds](https://youtu.be/yZZ6UTipwkM)

### Dictionary Default Values

<img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/01.%20Days%201-12/Day%202/Tests/06.%20Dictionary%20Default%20Values%202-2-19.png" width="300">

#2 - I missed a `:` in the code!

❌:
```swift
let abbreviations = ["m": "meters", "km": "kilometers"]
let meters = abbreviations["m", default "m"]
```

✅:
```swift
let abbreviations = ["m": "meters", "km": "kilometers"]
let meters = abbreviations["m", default: "m"]
```

#8 - Trying to read a dictionary key that does not exist is valid, but it returns nil. 

```swift
let albums = ["Prince": "Purple Rain"]
let beatles = albums["Beatles"]
```

### Creating Empty Collections

<img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/01.%20Days%201-12/Day%202/Tests/07.%20Creating%20Empty%20Collections%202-2-19.png" width="300">

#2 - I went too quickly and overlooked a `:`

❌:
```swift
var wines = Dictionary<String: String>()
```

✅:
```swift
var wines = Dictionary<String, String>()
```

### Enumerations

<img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/01.%20Days%201-12/Day%202/Tests/08.%20Enumerations%202-2-19.png" width="300">

#5 - A boolean is better suited for something like user login status, where an enum is good for things like genres of music.

### Enum Raw Values

<img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/01.%20Days%201-12/Day%202/Tests/10.%20Enum%20Raw%20Values%202-2-19.png" width="300">

#4 - I forgot that you don't need to give every case in an enum a raw value to use raw values.
