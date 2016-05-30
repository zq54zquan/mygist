//: Playground - noun: a place where people can play

import UIKit

//下标
struct TimesTable {
    let multipiler:Int
    subscript(index:Int)->Int {
        return multipiler*index
    }
}

let threeTimesTable = TimesTable(multipiler: 3)
print("3的6倍是\(threeTimesTable[6])")


//下标参数不可以是in-out的
//定义多参数
struct Matrix
{
    let row:Int, colume:Int
    var grid:[Double]
    init(row:Int,colume:Int) {
        self.colume = colume
        self.row = row
        grid = Array(count: row*colume, repeatedValue: 0.0)
    }
    
    func indexIsValidForRow(row:Int,colume:Int) ->Bool {
        return row>=0&&row < self.row && colume >= 0 && colume < self.colume
    }
    
    subscript(row:Int,colume:Int) -> Double{
        get {
            assert(indexIsValidForRow(row, colume: colume))
            return grid[row*self.colume+colume]
        }
        
        set {
            assert(indexIsValidForRow(row, colume: colume))
            grid[row*self.colume+colume] = newValue;
        }
    }
}


var matrix = Matrix(row: 2, colume: 2)
matrix[0,1] = 1.5
matrix[1,0] = 3.2

print(matrix.grid)

