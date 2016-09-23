//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//ARC！！！
class HTMLElement {
    
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name:String,text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

//optioanl Chaining

class Person {
    var residence : Residence?
}

class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
    
}

class Room {
    let name: String
    init(name:String) {
        self.name = name
    }
}

class Address {
    var buildingName : String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(buildingNumber) \(street)"
        } else {
            return nil
        }
    }
}

let john = Person()
let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress

//Error Handling
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar" : Item(price:12,count:7),
        "Chips": Item(price:10, count:4),
        "Pretzels": Item(price:7,count:11)
    ]
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

struct PurchasedSnack {
    let name: String
    init(name:String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8

do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection")
} catch VendingMachineError.outOfStock {
    print("Out of Stock")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}

//func processFile(filename: String) throws {
//    if exists(filename) {
//        let file = open(filename)
//        defer {
//            close(file)
//        }
//        while let line = try file.readline() {
//            
//        }
//    }
//}

//Nested Types
struct BlackjackCard {
    enum Suit:Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }
    enum Rank: Int {
        case two = 2, three,four,five,six,seven,eight,nine,ten
        case jack,queen,king,ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .ace:
                return Values(first:1, second: 11)
            case .jack, .queen,.king:
                return Values(first:10,second: nil)
            default:
                return Values(first:self.rawValue,second:nil)
            }
        }
    }
    
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}

let theAceOfSpades = BlackjackCard.init(rank: .ace, suit: .spades)
theAceOfSpades.description

//Generics
func swapTwoValues<T>(_ a: inout T,_ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

protocol Container {
    associatedtype ItemType
    mutating func append(_ item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct Stack<Element> : Container{
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
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

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

func findIndex<T:Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

extension Array: Container {}

func allItemsMatch<C1: Container,C2: Container>(_ someContainer: C1,_ anotherContainer: C2) -> Bool
    where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
        if someContainer.count != anotherContainer.count {
            return false
        }
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        return true
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")

var arrayOfStrings = ["uno","dos","tres"]
if allItemsMatch(stackOfStrings, arrayOfStrings) {
    print("All items match.")
} else {
    print("Not all items match")
}

//Advanced Operators
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 = 0b00111111
let middleFourBits = firstSixBits & lastSixBits
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits

//let colorHex: UInt32
//let redComponent = (colorHex & 0xFF000) >> 16
//let greenComponent = (colorHex & 0x00FF00) >> 8
//let blueComponet = (colorHex & 0x0000FF)

struct Vector2D {
    var x = 0.0, y = 0.0
}

prefix operator +++
infix operator +- { associativity left precedence 140 }
extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D.init(x: left.x + right.x, y: left.y + right.y)
    }
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D.init(x: -vector.x, y: -vector.y)
    }
    static func += (left: inout Vector2D,right: Vector2D) {
        left = left + right
    }
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
    static func != (left: Vector2D, right: Vector2D) -> Bool {
        return !(left == right)
    }
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D.init(x: left.x + right.x, y: left.y - right.y)
    }
}






