//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//Basic
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf:" there".characters, at: welcome.index(before: welcome.endIndex))
welcome.remove(at: welcome.index(before: welcome.endIndex))
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)

let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [2,4,6,8,0]
let singleDigitPrimeNumbers: Set = [2,3,5,7]

oddDigits.union(evenDigits)
oddDigits.intersection(evenDigits)
oddDigits.subtracting(singleDigitPrimeNumbers)
oddDigits.symmetricDifference(singleDigitPrimeNumbers)
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)
var namesofIntegers = [Int: String]()

//Function
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location)!")
}

greet(person: ["name":"John"])

if #available(iOS 10,macOS 10.12, *) {
    
} else {

}

func printAndCount(string: String) -> Int {
    print(string)
    return string.characters.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}

printAndCount(string: "hello, world")
printWithoutCounting(string: "hello, world")

func minMax(array: [Int]) -> (min: Int, max : Int)? {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let bounds = minMax(array: [9,16,-1,2,3,71])

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    
    return backward ? stepBackward : stepForward
}

var currentValue = -4

let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
print("Zero!")

//Closure

//Closure Expression Syntax
//{ (<#parameters#>) -> <#return type#> in
//    <#statements#>
//}

var names = ["Chris","Alex","Ewa","Barry","Daniella"]
func backward(_ s1: String,_ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
reversedNames = names.sorted(by: {(s1: String,s2:String) -> Bool in
    return s1 > s2
})
reversedNames = names.sorted(by: {(s1: String,s2:String) -> Bool in return s1 > s2})
reversedNames = names.sorted(by: {s1,s2 in return s1 > s2})
reversedNames = names.sorted(by: {s1,s2 in s1 > s2})
reversedNames = names.sorted(by: {$0 > $1})
reversedNames = names.sorted(by: >)

func makeIncrementer(forIncrement amount: Int) -> () ->Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()

func someFunctionWithNoescapeClosure(closure: () -> Void) {
    closure()
}
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () ->Void ) {
    completionHandlers.append(completionHandler)
}
class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        someFunctionWithNoescapeClosure {
            x = 200
        }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
completionHandlers.first?()
print(instance.x)

let nameProvider = { names.remove(at: 0) }
print("Now serving \(nameProvider())!")
print(names.count)
func serve(name nameProvider: () -> String) {
    print("Now serving \(nameProvider())!")
}
serve(name: { names.remove(at: 0)})

func serve(name nameProvider: @autoclosure ()->String) {
    print("Now serving \(nameProvider())!")
}

serve(name: names.remove(at: 0))

var nameProviders: [()->String] = []
func collectNameProviders(_ nameProvider: @autoclosure @escaping () -> String) {
    nameProviders.append(nameProvider)
}
collectNameProviders(names.remove(at: 0))
collectNameProviders(names.remove(at: 0))

print("Collected \(nameProviders.count) closures.")
for nameProvider in nameProviders {
    print("Now serving \(nameProvider())!")
}


