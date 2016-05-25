//: Playground - noun: a place where people can play

import UIKit

//类和结构体
//类和结构体定义
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name:String?
}

//实例
let someResolution = Resolution()
let someVideoMode = VideoMode()

//属性访问
print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

//结构体的成员逐一构造器,类实例没有默认是成员逐一构造器
let vga = Resolution(width: 640, height: 480)

//结构体和枚举是值类型的
//swift的内建类型都是值类型，内部都是以struct实现
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd //cinema和hd是两个不同的实例，指向不同的内存地址
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")

print("hd is now \(hd.width) pixel width")

enum CompassPoint {
    case North,South,East,West
}

var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
if rememberedDirection == .West {
    print("The remembered direction is still .West")
}

//类是引用类型
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEight = tenEighty;//alsoTenEight 和 tenEight是同一个实例
alsoTenEight.frameRate = 30.0
//恒等运算符
if tenEighty === alsoTenEight { //表示两个常量或变量引用的是同一个类实例
    print("tenEighty and alsoTenEight refer to the some Resolution")
}



