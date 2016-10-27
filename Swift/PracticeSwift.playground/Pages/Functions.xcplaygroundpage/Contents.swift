//: [Previous](@previous)

import Foundation

func greeting(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greeting(person: "Anna"))
print(greeting(person: "Brian"))

func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
print(greetAgain(person: "Anna"))

func sayHelloWorld() -> String {
    return "hello, world"
}

print(sayHelloWorld())

func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greeting(person: person)
    }
}

print(greet(person: "Tim", alreadyGreeted: true))

func greet(person: String) {
    print("Hello, \(person)")
}

greet(person: "Dave")

func printAndCount(string: String) -> Int {
    print(string)
    return string.characters.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}

printAndCount(string: "hello, world")
printWithoutCounting(string: "hello, world")

func minMax(array: [Int]) -> (min: Int, max: Int)? {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMin,currentMax)
}

if let bounds = minMax(array: [8,-6,2,109,3,71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}

func someFunction(firstParameterName: Int,secondParameterName: Int) {

}
someFunction(firstParameterName: 1, secondParameterName: 2)

func someFunction(argumentLabel parameterName: Int) {

}

someFunction(argumentLabel: 3)

func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)"
}

func someFunction(_ firstParameterName: Int, secondParameterName: Int) {

}

someFunction(1, secondParameterName: 2)

func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {

}

someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6)
someFunction(parameterWithoutDefault: 4)

func arithmeticMean(_ numbers: Double...) -> Double {
    var total:Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(1,2,3,4,5)
arithmeticMean(3,8.5,18.75)

func swapTwoInts(_ a:inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swap(&someInt, &anotherInt)

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

func printHelloWorld() {
    print("hello, world")
}

var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result : \(mathFunction(2,3))")

mathFunction = multiplyTwoInts
print("Result : \(mathFunction(2,3))")

let anotherMathFunction = addTwoInts

func printMathResult(_ mathFunction:(Int, Int) -> Int,_ a: Int, _ b: Int) {
    print("Result : \(mathFunction(a,b))")
}

printMathResult(addTwoInts, 3, 5)

func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int {return input + 1}
    func stepBackward(input: Int) -> Int {return input - 1}
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

print("Counting to zero:")
while currentValue != 0 {
    print("\(currentValue)")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")




