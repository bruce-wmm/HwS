<p align="center"><img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/00.%20Resources/banner.png" width="500"></p>

## Day 1 Notes

[Summary - Simple Types](https://youtu.be/3-6cyNw1Ync)

<p align="center"><img src="https://github.com/neilhiddink/100DaysOfSwift/blob/master/01.%20Days%201-12/Day%201/Tests/00.%20Day%201%20Progress%202-1-19.png" width="500"></p>

### Multi-line Strings

I didn't know that the `"""` had to be on its own line for the opening and closing lines.

❌:
```swift
var multilineString = """
This
is
a
multiline
comment"""
```

✅:
```swift
var multilineString = """
This
is
a
multiline
comment
"""
```

[Multi-line strings – Swift in Sixty Seconds](https://youtu.be/Ppl-8E1YgRU)

1. Three `"""` on their own lines
2. Opening and closing line breaks won't be included in your string
3. To ignore a new line , add a backslash `\`

