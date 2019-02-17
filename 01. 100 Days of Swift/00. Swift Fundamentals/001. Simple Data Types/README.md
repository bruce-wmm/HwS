<p align="center"><img src="https://github.com/neilhiddink/HwS/blob/1aff6f6451bfbef908e80d071cde9f3f30158242/00.%20Resources/banner-100.png" width="500"></p>

## Day 1 Notes

[Summary - Simple Types](https://youtu.be/3-6cyNw1Ync)

<p align="center"><img src="" width="500"></p>

### Multi-line Strings

<img src="" width="300"></p>

#2 - I didn't know that the `"""` had to be on its own line for the opening and closing lines.

❌:
```swift
var multilineString = """
This
is
a
multiline
string"""
```

✅:
```swift
var multilineString = """
This
is
a
multiline
string
"""
```

[Multi-line strings – Swift in Sixty Seconds](https://youtu.be/Ppl-8E1YgRU)

1. Three `"""` on their own lines
2. Opening and closing line breaks won't be included in your string
3. To ignore a new line , add a backslash `\`

