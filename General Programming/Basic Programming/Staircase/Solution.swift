import Foundation

// Complete the staircase function below.
func staircase(n: Int) -> Void {
    for i in 1...n {
        let spaces = String(repeating: " ", count: n-i)
        let hashes = String(repeating: "#", count: i)
        print(spaces + hashes)
    }
}

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

staircase(n: n)

