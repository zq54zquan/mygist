//: Playground - noun: a place where people can play

import UIKit
//枚举
enum CompassPoint { //和oc不一样，枚举值不是默认的int，本身就是一种类型是CompassPoint
    case North
    case South
    case East,West //多个值可以写在一行
}

var directionToHead = CompassPoint.West
directionToHead = .East

switch directionToHead {
case .North:
    print("Lots of plants have a north")
case .South:
    print("Watch out for penguins")
case .East:
    print("Where sun rises")
case .West:
    print("Where the skies are blue")
}
//关联值
//枚举中每个值的关联可以是不同的类型.像union
enum Barcode {
    case UPCA(Int,Int,Int,Int)
    case QRCode(String)
}

var productBarcode = Barcode.UPCA(8, 85909, 51226,3)
productBarcode = .QRCode("ABCDEFGHIJKLMNOP")
switch productBarcode {
case .UPCA(let numberSystem,let manufacture,let product,let check) :
    print("UPC-A :\(numberSystem),\(manufacture),\(product),\(check)")
case .QRCode(let productCode):
    print("QR code: \(productCode)")
}

switch productBarcode {
case let .UPCA(numberSystem,manufacture,product,check) :
    print("UPC-A :\(numberSystem),\(manufacture),\(product),\(check)")
case let .QRCode(productCode):
    print("QR code:\(productCode)")
}

//原始值
//原始值的类型必现相同
enum ASCIIControlCharacter:Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageRetuen = "\r"
}

//原始值的默认赋值
//原始值是整形或者字符串类型时，swift自动赋值
//整型第一个是默认0.后续值默认递增
enum Plant:Int {
    case Mercury = 1, Venus,Earth,Mars,Jupiter,Saturn,Uranus,Neptune
}

//字符串作为原始值时，枚举类型的原始值默认是枚举的名称
enum CompassPoint1:String {
    case North, Sourth, East, West
}

let earthsOrder = Plant.Earth.rawValue
let sunsetDirection = CompassPoint1.West.rawValue

let possiblePlant = Plant(rawValue:7) //返回的其实是可选值，这个构造函数是个返回可选值的构造函数(可失败构造函数)
let positionToFind = 9
if let somePlant = Plant(rawValue:positionToFind) {
    switch somePlant {
    case .Earth :
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
}else {
    print("There isn't a plant at position \(positionToFind)")
}

//递归枚举
enum ArithmeticExpression {
    case Number(Int)
    indirect case Addition(ArithmeticExpression , ArithmeticExpression) //可递归的枚举值，indirect修饰
    indirect case Multiplication(ArithmeticExpression,ArithmeticExpression)
}

func evaluate(expression:ArithmeticExpression)->Int {
    switch expression {
    case .Number(let value):
        return value
    case let .Addition(a , b):
        return evaluate(a)+evaluate(b)
    case .Multiplication(let a,let b):
        return evaluate(a)-evaluate(b)
    }
}

let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))
print(evaluate(product))









