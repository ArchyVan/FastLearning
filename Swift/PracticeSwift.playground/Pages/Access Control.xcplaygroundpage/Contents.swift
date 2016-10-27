//: [Previous](@previous)

import Foundation

public class SomePublicClass {
    public var somePublicProperty = 0
    var someInternalProperty = 0
    fileprivate func someFilePrivateMethod() {}
    private func somePrivateMethod() {}
}
internal class SomeInternalClass {
    var someInternalProperty = 0
    fileprivate func someFilePrivateMethod() {}
    private func somePrivateMethod() {}
}
fileprivate class SomeFilePrivateClass {
    func someFilePrivateMethod() {}
    private func somePrivateMethod() {}
}
private class SomePrivateClass {
    func somePrivateMethod() {}
}

//class SomeInternalClass {}              // implicitly internal
//let someInternalConstant = 0            // implicitly internal

let pubClass = SomePublicClass()
let intClass = SomeInternalClass()
fileprivate let filClass = SomeFilePrivateClass()
private let priClass = SomePrivateClass()

pubClass.someFilePrivateMethod()
pubClass.somePublicProperty
pubClass.someInternalProperty

intClass.someInternalProperty
intClass.someFilePrivateMethod()

filClass.someFilePrivateMethod()

priClass.somePrivateMethod()

//func someFunction() -> (SomeInternalClass, SomePrivateClass) {}
//private func someFunction() -> (SomeInternalClass, SomePrivateClass) {}

public enum CompassPoint {
    case north
    case south
    case west
    case east
}

//public class A {
//    private func someMethod() {}
//}
//
//internal class B : A {
//    override internal func someMethod() {
//        super.someMethod()
//    }
//}

struct TrackedString {
    private(set) var numberOfEdits = 0
    var value : String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    public init() {}
}

var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked"
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")



