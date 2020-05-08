import UIKit

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
