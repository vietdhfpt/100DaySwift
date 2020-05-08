import UIKit

// MARK: Sequence Map

let numbers = [1, 2, 3, 4, 5]
let doubled = numbers.map { $0 * 2 }
print(doubled)

let strings = ["Apples", "Banana", "Pear"]
let uppercased = strings.map { $0.uppercased() }

print(uppercased)

extension Sequence {
    public func map2<T>(_ transform: (Element) -> T) -> [T] {
        var result = [T]()
        for item in self {
            result.append(transform(item))
        }
        return result
    }
}

print(strings.map2 { $0.uppercased() })




// MARK: Sequence CompactMap

let scoreStrings = ["100", "85", "fish"]
let scoreInts = scoreStrings.compactMap { Int($0) }
print(scoreInts)

let stringUrls = ["apple.com", "hackingSwift.com"]
let urls = stringUrls.compactMap { URL(string: $0) }
print(urls)

extension Sequence {
    public func compactMap2<T>(_ transform: (Element) throws -> T?) rethrows -> [T] {
        var result = [T]()
        for item in self {
            if let transform = try transform(item) {
                result.append(transform)
            }
        }
        return result
    }
}

print(scoreStrings.compactMap2 { Int($0) })




// MARK: Sequence FlatMap

let values = [[1,2,3], [4,5,6], [7,8,9]]
print(values.flatMap { $0 })

var myArr = [1, 2, 3, 4, nil, 8, 9]
let a = myArr.compactMap { $0 }
print(a)

extension Sequence {
    public func flatMap2<T: Sequence>(_ transform: (Element) throws -> T) rethrows -> [T.Element] {
        var result = [T.Element]()
        
        for item in self {
            result += try transform(item)
        }
        
        return result
    }
}

print(values.flatMap2 { $0 })




// MARK: Sequence Contains

extension Sequence where Element: Equatable {
    func contains2(_ item: Element) -> Bool {
        for element in self {
            if element == item {
                return true
            }
        }
        
        return false
    }
}

print(numbers.contains(5))
print(strings.contains2("Grap"))
