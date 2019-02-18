 <p align="center"><img src="https://github.com/neilhiddink/HwS/blob/1aff6f6451bfbef908e80d071cde9f3f30158242/00.%20Resources/banner-100.png" width="500"></p>
 
# 📱 Storm Viewer

This is the final version of my project.

 <p align="center"><img src="https://media.giphy.com/media/1BGSyKTIWryNWISnnG/giphy.gif" width="200"></p>

## Day 16 (Part 1)

I followed along with the videos closely and understood everything.

I did deviate a bit and decided to use a guard statement to avoid force unwrapping optionals in one place:

```swift
let fileManager = FileManager.default
guard let path = Bundle.main.resourcePath,
      let items = try? fileManager.contentsOfDirectory(atPath: path) else { return }
```

## Day 17 (Part 2)

I experimented with custom `UITableViewCell` and the `cornerRadius` property of `UIImageView` to create the circular images in my tableview. I divided the width of the `UIImageView`'s frame by two to set the correct `cornerRadius`. 

After completing the videos for today, I decided to experiment by adding a `UIPinchGestureRecognizer` to the `DetailViewController`. My implementation roughly followed this tutorial from **A Swiftly Tilting Planet**'s [Handling Pinch Gestures ( Swift 4 - 2018 )](https://youtu.be/x_u29UpaoPo) on YouTube.

## Future Plans

- Explore performance with larger amounts of data
- Allow users to add their own images
- Persist data using a backend
