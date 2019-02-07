import UIKit

// Functions

enum ArrayError: Error {
    case negateIndex
}
func readItem(_ index: Int, from array: [String]) -> String {
    if index < 0 {
        throw ArrayError.negateIndex
    }
    return array[index]
}
// TRUE


enum WifiError: Error {
    case noNetwork
    case noSignal
}
func connectToWifi(_ password: String) throws {
    if password == "" {
        throw WifiError.badPassword
    }
    print("You're connected.")
}
