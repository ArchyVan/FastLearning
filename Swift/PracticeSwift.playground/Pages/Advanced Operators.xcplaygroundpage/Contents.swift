//: [Previous](@previous)

import Foundation

let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits

let firstSixBits : UInt8 = 0b11111100
let lastSixBits : UInt8 = 0b00111111
let middleFourBits: UInt8 = firstSixBits & lastSixBits

let someBits : UInt8 = 0b10110010
let moreBits : UInt8 = 0b01011110
let combinedbits = someBits | moreBits

let firstBits : UInt8 = 0b00010100
let otherBits : UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits

let shiftBits: UInt8 = 4
shiftBits << 1
shiftBits << 2
shiftBits << 5
shiftBits << 6
shiftBits >> 2

let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16
let greenComponent = (pink & 0x00FF00) >> 8
let blueComponent = (pink & 0x0000FF)

var potentialOverflow = Int16.max
//potentialOverflow += 1

var unsignedOverflow = UInt8.max
unsignedOverflow = unsignedOverflow &+ 1

unsignedOverflow = UInt8.min
unsignedOverflow = unsignedOverflow &- 1

var signedOverflow = Int8.min
signedOverflow = signedOverflow &- 1

struct Vector2D {
    var x = 0.0,y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D,right:Vector2D) -> Vector2D{
        return Vector2D(x:left.x + right.x,y: left.y + right.y)
    }
}

let vector = Vector2D(x:3.0,y:1.0)
let anotherVector = Vector2D(x:2.0,y:4.0)
let combinedVector = vector + anotherVector

extension Vector2D {
    static func - (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x - right.x,y: left.y - right.y)
    }
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D.init(x: -vector.x, y: -vector.y)
    }
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive

let alsoPositive = -negative


extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}
var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd

extension Vector2D {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
    static func != (left: Vector2D, right: Vector2D) -> Bool {
        return !(left == right)
    }
}

let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vectors are equivalent.")
}

prefix operator +++
extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var toBeDoubled = Vector2D(x:1.0,y:4.0)
let afterDoubling = +++toBeDoubled

infix operator +-: AdditionPrecedence
extension Vector2D {
    static func +- (left:Vector2D,right:Vector2D) -> Vector2D {
        return Vector2D(x: left.x+right.x,y:left.y-right.y)
    }
}

let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector