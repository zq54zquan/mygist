//: Playground - noun: a place where people can play

import UIKit

//属性

//存储属性
//只能用在类或者结构体
struct FixedLengthRange {
    var firstValue:Int
    let length:Int
}

var rangOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangOfThreeItems.firstValue = 6
//rangOfThreeItems.length = 4 //length 是常量，不能修改


//常量结构体的存储属性
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6 //struct是值类型，整个值是常量。属性也不能修改

//延迟存储属性
//延迟属性必须是变量，因为属性的初始值可能会在实例构造完成之后才能得到，常量属性是必现在构造过程完成之前就必现确定的。
class  DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer:DataImporter = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("some more data")//importer 属性一直没有创建

print(manager.importer.fileName) //这个时候才会创建importer的实例 
//lazy不能保证线程安全

//计算属性必须是变量
//类，结构体，枚举可以定义计算属性
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center:Point {
        get {
            let centx = origin.x + size.width*0.5
            let centy = origin.y + size.height*0.5
            return Point(x: centx, y: centy)
        }
        set(newValue) { //不写参数名，默认使用newValue
            origin.x = newValue.x - size.width*0.5
            origin.y = newValue.y - size.height*0.5
        }
    }
}

var square = Rect(origin: Point(x:0.0,y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)

//只读计算属性
struct Cuboid {
    var width = 0.0,height=0.0,depth=0.0
    var volume:Double { //只读计算属性可以去掉get和花括号
        return width*height*depth
    }
}

//属性观察器
//可以为延迟属性外的其他存储属性添加观察器
class StepCount {
    var totalSteps :Int = 0 {
        willSet {
            print("about to set totalSteps to \(newValue)")
        }
        
        didSet { //在这边给属性赋值的话会替换掉之前的值
            if totalSteps>oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCount()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360

//全局变量和局部变量

var s:Int  {
    get {
        return 3
    }
    set {
        print("new value\(newValue)")
        
    }
}

var d = 0 {
willSet {
   print("will set value\(newValue)")
}
}

//类型属性
//计算型类型属性只能是变量属性
//存储型类型属性必须有默认值，因为类型属性不能在构造函数中确定
//存储型类型属性是延迟初始化的，只有第一次被访问的时候才会初始化。线程安全，不需要lazy修饰
struct SomeStruct {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty:Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value"
    static var computedType:Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty:Int {
        return 27
    }
    
    class var overrideableComputedTypeProperty:Int { //可以让子类复写
        return 107
    }
}

print(SomeStruct.storedTypeProperty)
SomeStruct.storedTypeProperty = "Another Value"
print(SomeStruct.storedTypeProperty)


print(SomeEnumeration.computedType)
print(SomeClass.computedTypeProperty)

class AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannel = 0
    var currentLevel:Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            
            if currentLevel > AudioChannel.maxInputLevelForAllChannel {
                AudioChannel.maxInputLevelForAllChannel = currentLevel;
            }
        }
        
        
    }
}

let leftChannel = AudioChannel()
let rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)




