<p align="center"><img src="https://github.com/neilhiddink/HwS/blob/1aff6f6451bfbef908e80d071cde9f3f30158242/00.%20Resources/banner-100.png" width="500"></p>

## Day 2 Notes

[Summary - Complex Types](https://youtu.be/4dKDADbQtXY)

<p align="center"><img src="https://github.com/neilhiddink/HwS/blob/master/01.%20100%20Days%20of%20Swift/00.%20Swift%20Fundamentals/002.%20Complex%20Data%20Types/Tests/00.%20Day%202%20Progress%202-2-19.png" width="500"></p>

### Sets

<img src="https://github.com/neilhiddink/HwS/blob/master/01.%20100%20Days%20of%20Swift/00.%20Swift%20Fundamentals/002.%20Complex%20Data%20Types/Tests/02.%20Sets%202-2-19.png" width="300">

#7 - I forgot about the shorthand rule for Sets. [Unlike arrays, sets do not have an equivalent shorthand form.](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html)

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

<img src="https://github.com/neilhiddink/HwS/blob/master/01.%20100%20Days%20of%20Swift/00.%20Swift%20Fundamentals/002.%20Complex%20Data%20Types/Tests/04.%20Arrays%20vs%20Sets%20vs%20Tuples%202-2-19.png" width="300">

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

<img src="https://github.com/neilhiddink/HwS/blob/master/01.%20100%20Days%20of%20Swift/00.%20Swift%20Fundamentals/002.%20Complex%20Data%20Types/Tests/07.%20Creating%20Empty%20Collections%202-2-19.png" width="300">

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

<img src="https://github.com/neilhiddink/HwS/blob/master/01.%20100%20Days%20of%20Swift/00.%20Swift%20Fundamentals/002.%20Complex%20Data%20Types/Tests/08.%20Enumerations%202-2-19.png" width="300">

#5 - A boolean is better suited for something like user login status, where an enum is good for things like genres of music.

### Enum Raw Values

<img src="" width="300">

#4 - I forgot that you don't need to give every case in an enum a raw value to use raw values.
