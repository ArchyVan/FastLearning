//: [Previous](@previous)

import Foundation

///Array
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items")

someInts.append(3)
someInts = []

var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

var shoppingList: [String] = ["Eggs","Milk"] // var shoppingList = ["Eggs","Milk"]
print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is empty")
} else {
    print("The shopping list is not empty")
}

shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread","Cheese","Butter"]

var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"
shoppingList[4...6] = ["Bananas","Apples"]
shoppingList.insert("Maple Syrup", at: 0)
let mapleSyrup = shoppingList.remove(at: 0)

let apples = shoppingList.removeLast()
for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

///Set
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

letters.insert("a")
letters = []

var favoriteGenres: Set<String> = ["Rock","Classical","Hip hop"]//var favoriteGenres: Set = ["Rock","Classical","Hip hop"]

print("I have \(favoriteGenres.count) favorite music genres")

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}

favoriteGenres.insert("Jazz")

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}


if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}


for genre in favoriteGenres {
    print("\(genre)")
}

for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let singleDigitPrimeNumbers: Set = [2,3,5,7]
oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true”

///Dictionary
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

var airports : [String: String] = ["YYZ":"Toronto Pearson","DUB":"Dublin"]//var airports := ["YYZ":"Toronto Pearson","DUB":"Dublin"]
print("The airpors dictionary contains \(airports.count) items")

if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}

airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue)")
}

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName)")
} else {
    print("The airport is not in the airports dictionary")
}

airports["APL"] = "Apple International"
airports["APL"] = nil

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

for (airportCode,airportName) in airports {
    print("\(airportCode): \(airportName)")
}
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)


       
