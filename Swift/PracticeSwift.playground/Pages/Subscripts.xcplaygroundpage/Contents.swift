//: [Previous](@previous)

import Foundation

//subscript(index: Int) -> Int {
//
//}

struct TimesTable {
    let multiplier : Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier:3)
print("six times three is \(threeTimesTable[6])")

var numberOfLegs = ["spider":8,"ant":6,"cat":4]
numberOfLegs["bird"] = 2

struct Matrix {
    let rows : Int, columns: Int
    var grid : [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        self.grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns:2)
matrix[0,1] = 1.5
matrix[1,0] = 3.2

