import Foundation


// Complete the diagonalDifference function below.
func diagonalDifference(a: [[Int]]) -> Int {    
    let diag1 = Array(0..<a.count)    
    return abs(summ(a, diag1) - summ(a, Array(diag1.reversed())))
}

func summ(_ array: [[Int]], _ indexes: [Int]) -> Int {
    return zip(array, indexes).reduce(0) {$0 + $1.0[$1.1]}
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let a: [[Int]] = AnyIterator{ readLine() }.prefix(n).map {
    let aRow: [Int] = $0.split(separator: " ").map {
        if let aItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return aItem
        } else { fatalError("Bad input") }
    }

    guard aRow.count == n else { fatalError("Bad input") }

    return aRow
}

guard a.count == n else { fatalError("Bad input") }

let result = diagonalDifference(a: a)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

