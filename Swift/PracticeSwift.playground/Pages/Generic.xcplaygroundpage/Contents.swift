//: [Previous](@previous)

import Foundation

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoValues<T>(_ a: inout T,_ b: inout T) {
    (a, b) = (b, a)
}

var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, &anotherInt)

struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")

let fromTheTop = stackOfStrings.pop()

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfStrings.topItem {
    print("The top item on stack is \(topItem)")
}

//func someFunction<T: SomeClass, U:SomeProtocol>(someT:T,someU:U) {
//
//}

func findIndex<T:Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let doubleIndex = findIndex(of: 9.3, in: [3.14159,0.1,0.25])
let stringIndex = findIndex(of: "Andrea", in: ["Mike","Andrea","Malcolm"])

protocol Container {
    associatedtype ItemType
    mutating func append(_ item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct IntStack : Container {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
    typealias ItemType = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}


extension Stack : Container {

    typealias ItemType = Element
    mutating func append(_ item: Element) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Element {
        return items[i]
    }
}

func allItemsMatch<C1:Container,C2:Container>(_ someContainer: C1,_ anotherContainer: C2) -> Bool where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
    if someContainer.count != anotherContainer.count {
        return false
    }
    for i in 0..<someContainer.count
    {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    return true
}

var newStackOfStrings = Stack<String>()
newStackOfStrings.push("uno")
newStackOfStrings.push("dos")
newStackOfStrings.push("tres")

var arrayOfStrings = ["uno", "dos", "tres"]

if allItemsMatch(stackOfStrings, newStackOfStrings) {
    print("All items match.")
} else {
    print("Not all items match.")
}