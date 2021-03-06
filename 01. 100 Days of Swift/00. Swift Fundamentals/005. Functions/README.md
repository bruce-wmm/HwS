<p align="center"><img src="https://github.com/neilhiddink/HwS/blob/1aff6f6451bfbef908e80d071cde9f3f30158242/00.%20Resources/banner-100.png" width="500"></p>

## Day 5 Notes

[Summary - Functions](https://youtu.be/5PcYq4M6Qaw)

<p align="center"><img src="https://github.com/neilhiddink/HwS/blob/1aff6f6451bfbef908e80d071cde9f3f30158242/01.%20100%20Days%20of%20Swift/00.%20Swift%20Fundamentals/005.%20Functions/Tests/00.%20Day%205%20Progress%202-5-19.png" width="500"></p>

### Parameter Labels

<img src="" width="300">

#12 - Overlooked `in` parameter name in method call on the last line. Should be `place`.

### Omitting Parameter Labels

<img src="https://github.com/neilhiddink/HwS/blob/1aff6f6451bfbef908e80d071cde9f3f30158242/01.%20100%20Days%20of%20Swift/00.%20Swift%20Fundamentals/005.%20Functions/Tests/05.%20Omitting%20Parameter%20Labels%202-5-19.png" width="300">

#6 - The function shouldn't return anything.

### Writing Throwing Functions

<img src="https://github.com/neilhiddink/HwS/blob/1aff6f6451bfbef908e80d071cde9f3f30158242/01.%20100%20Days%20of%20Swift/00.%20Swift%20Fundamentals/005.%20Functions/Tests/08.%20Writing%20Throwing%20Functions%202-5-19.png" width="300">

#8 - Missing the `throws` keyword.

#12 - `WifiError.badPassword` isn't a case in the enum.

### 💡 New Concepts:

- Errors we can throw must be of type  `Error`. When using an `enum`:

❌:
```swift
enum PasswordError {
case obvious
}
```

✅:
```swift
enum PasswordError: Error {
case obvious
}
```
- Regular parameters are passed into functions as constants. If you need to store a value, use `inout`
