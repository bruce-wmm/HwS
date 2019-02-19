 <p align="center"><img src="https://github.com/neilhiddink/HwS/blob/1aff6f6451bfbef908e80d071cde9f3f30158242/00.%20Resources/banner-100.png" width="500"></p>
 
# 📱 Storm Viewer

## Day 16 (Part 1)

I followed along with the videos closely and understood everything.

I did deviate a bit and decided to use a guard statement to avoid force unwrapping optionals in one place:

```swift
let fileManager = FileManager.default
guard let path = Bundle.main.resourcePath,
      let items = try? fileManager.contentsOfDirectory(atPath: path) else { return }
```

## Day 17 (Part 2)

<p align="center"><img src="https://media.giphy.com/media/1BGSyKTIWryNWISnnG/giphy.gif" width="200"></p>

I experimented with custom `UITableViewCell` and the `cornerRadius` property of `UIImageView` to create the circular images in my tableview. I divided the width of the `UIImageView`'s frame by two to set the correct `cornerRadius`. 

After completing the videos for today, I decided to experiment by adding a `UIPinchGestureRecognizer` to the `DetailViewController`. My implementation roughly followed this tutorial from **A Swiftly Tilting Planet**'s [Handling Pinch Gestures ( Swift 4 - 2018 )](https://youtu.be/x_u29UpaoPo) on YouTube.

## Day 18 (Part 3)

<p align="center"><img src="https://media.giphy.com/media/Fdp13AqiA9xbzdEDoF/giphy.gif" width="200"></p>

### Challenges - I added additional features to StormViewer based on what's been taught so far in the course.

- [x] Use Interface Builder to select the text label inside your table view cell and adjust its size to something larger.
- [x] In your main table view, show the image names in sorted order, i.e. so "nssl0033.jpg" comes before "nssl0034.jpg".
- [x] Rather than show image names in the detail title bar, show "Picture X of Y", where Y is the total number of images and X is the picture's postion in the array.

### Test - Project 1 Review

<img src="https://github.com/neilhiddink/HwS/blob/d99dbc9e2ec8664c4b90a85fed39a9e3ed50fd85/01.%20100%20Days%20of%20Swift/02.%20iOS%20-%20Beginner/016-018.%20Project%201/Tests/Project%201%20Review%202-18-19.png" width="300">

## Future Plans

- Explore performance with larger amounts of data
- Allow users to add their own images
- Persist data using a backend
