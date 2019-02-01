import Foundation

// Write a function that accepts a filename on disk, then prints its last N
// lines in reverse order, all on a single line separated by commas.

func printLastLinesFrom(_ name: String, lines: Int) {
    
    guard let input = try? String(contentsOfFile: "input", encoding: .ascii) else { return }
    let array = input.components(separatedBy: "\n")
    for i in lines...(array.count - 1) {
        print(<#T##items: Any...##Any#>)
    }
}

// Tests

printLastLinesFrom("input.txt", lines: 3)

print("All tests passed.")
