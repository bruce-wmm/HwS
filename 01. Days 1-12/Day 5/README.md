<p align="center"><img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/00.%20Resources/banner.png" width="500"></p>

## Day 5 Notes

[Summary - ]()

<p align="center"><img src="" width="500"></p>

### Parameter Labels

<img src="" width="300">

#12 - Overlooked `in` parameter name in method call on the last line. Should be `place`.

### Omitting Parameter Labels

<img src="" width="300">

#6 - The function shouldn't return anything.

### Writing Throwing Functions

<img src="" width="300">

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
