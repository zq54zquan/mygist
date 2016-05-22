//: Playground - noun: a place where people can play

import UIKit

let (x,y) = (1,2)

"hello, "+"world"

//余数的符号只和被除数有关，相同
//let a = 9
//let b = -5
//let c = a%b
//let d = a%(-b)

var a = 0
var b = ++a
var c = a++

let three = 3
let minusThree = -three
let plusThree = -minusThree

//空合运算符
let defaultColorName = "red"
var userDefinedColorName:String?
var colorNameToUse = userDefinedColorName ?? defaultColorName

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName

//区间运算符
for index in 1...5 { //闭区间
    print("\(index) *5 = \(index*5)" )
}

let names = ["Anna","Alex","Brian","Jack"]
let count = names.count
for i  in 0..<count { //半开区间
    print("第\(i+1) 个人叫 \(names[i])")
}

