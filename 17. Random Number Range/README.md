<img src="https://github.com/nhiddink/HackingWithSwift/blob/master/logo.png" width="1000">

#### Challenge 17: Random Number Range

You have several different options for random number generation in this example. Note that the one you choose says a lot about how far along you are in your Swift development career. The best two options are:

1. Use `arc4random_uniform`:

This is the preferred approach for most developers, especially because this function is **not limited to Apple platforms**. That said, there are a couple of things to keep in mind:

- First, the upperbound parameter accepted by `arc4random_uniform` is a UInt32 instead of an Int.
- Second, the upper bound is excluded. Make sure to add one to isolate the range you want:
- Finally, to introduce a minimum other than zero.

Putting this together, you get:

```swift
    let min = 1
    let max = 5
    let randomNumber = Int(arc4random_uniform(UInt32(max - min + 1))) + min
```

Which stores a random number between 1 and 5 inclusive in the `randomNumber` variable.

2. Use `Int.random(in:)`:

This is the latest and most convenient solution from Apple. 

```swift
    let min = 1
    let max = 5
    let randomNumber = Int.random(in: min...max)
```
