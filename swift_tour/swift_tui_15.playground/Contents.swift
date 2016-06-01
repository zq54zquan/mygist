//: Playground - noun: a place where people can play

import UIKit

//构造过程

//存储属性的初赋值
//设置默认值或者init方法中赋值不会触发监听器


struct Fahrenheit {
    var temperature:Double = 32.0
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()

struct Celsius {
    var temperatureInCelsius:Double
    init(formFahrenheit fahrenheit:Double) {
        temperatureInCelsius = (fahrenheit-32.0)/1.8
    }
    
    init(fromKelvin kelvin:Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    
    init(_ celsius:Double) { //隐藏参数
        temperatureInCelsius = celsius
    }
}

let bollingPointOfWater = Celsius(formFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
let bodyTemperature = Celsius(37.0)


struct Color {
    let red,green,blue:Double
    init(red:Double,green:Double,blue:Double) {
        self.red = red;
        self.green = green
        self.blue = blue
    }
    
    init(white:Double) {
        red = white
        green = white
        blue = white
    }
}

let magenate = Color(red: 1.0, green: 0.0, blue: 1.0)

let halfGray = Color(white: 0.5)


//可选值
class SurveyQuestion {
//    var text:String
    let text:String //常量在构造函数上也可以赋值
    var response:String?
    init(text:String) {
        self.text = text
    }
    
    func ask()  {
        print(text)
    }
}

//默认构造器
//class ShoppintListItem {
//    var name:String?
//    var quantity = 1
//    var purcahsed:Bool = true
//}
//结构体的逐一成员构造器
struct Size {
    var width = 0.0
    var height = 0.0
}

let twoByTwo = Size(width: 2.0, height: 2.0)

//值类型的构造器代理
//如果你为值类型定义了构造器，就不能访问默认构造器了
struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()//默认构造器
    var size = Size() //默认构造器
    init() {}
    
    init(origin:Point,size:Size) {
        self.origin = origin
        self.size = size
    }
    
    init(center:Point,size:Size) {
        let originX = center.x - size.width*0.5
        let originY = center.y - size.height*0.5
        self.init(origin:Point(x: originX, y: originY),size: size);
    }
}

let basicRect = Rect()
let originRect = Rect(origin:Point(x: 2.0,y: 2.0)  , size: Size(width: 3.0, height: 3.0))
//类的继承和构造过程
//子类不能访问父类的便利构造器

class Vehicle {
    var numberOfWheels = 0
    var description:String {
        return "\(numberOfWheels) wheels"
    }
}

let vehicle = Vehicle()
print("Vehicle \(vehicle.description)")


class Bicycle : Vehicle {
    override init() {
         super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")

//自动构造器的继承
//1 子类没有定义任何指定构造器 自动继承所有父类的指定构造器
//2 子类提供了父类的全部指定构造器实现， 规则一继承过来的也算 自动继承父类便利构造器

class Food {
    var name:String
    init(name:String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name:"[Unamed]")
    }
}

let namedMeat = Food(name: "Bacon")
let mysteryMeat = Food()

class RecipeIngredient:Food {
    var quantity:Int
    init(name: String , quantity:Int) {
        self.quantity = quantity
        super.init(name: name);
    }
    
//     convenience init() {//子类构造器重写父类的便利构造器不需要override，便利构造器和父类没有直接关系
//        self.init(name:"",quantity: 1)
//    }
    
    convenience override init(name: String) { //子类构造器重写父类直接构造器。需要override
        self.init(name:name,quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class ShoppingListItem:RecipeIngredient { //没有指定任何构造器，自动从父类继承了指定构造函数和便利构造函数
    var purchased = false
    var description:String {
        var out = "\(quantity) X \(name)"
        out += purchased ? "v" : "x"
        return out;
    }
}

//可失败构造器
struct Animal {
    let species :String
    init?(species:String) {
        if species.isEmpty  {
            return nil
        }
        self.species=species
    }
}

let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature {
    
}


//枚举的可失败构造

enum TemperatureUnit {
    case Kelvin,Celsius,Fahrenheit
    init?(symbol:Character) {
        switch symbol {
        case "k":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")

//带原始值的枚举可失败
//自带一个 init?(rawValue:)
enum TemperatureUnit1 : Character {
    case Kelvin = "K", Celsius = "C",Fahrenheit = "F"
}

let fahrenheitUnit1 = TemperatureUnit1(rawValue: "F")

//类的可失败构造器
//所有的类属性初始化和所有类之间的构造器之间的代理调用完之后触发失败

class Product {
    let name:String
    init?(name:String) {
        self.name = name //在返回nil失败之前要先把存储属性初始化

        if name.isEmpty {
            return nil
        }
    }
}


if let bowTie = Product(name: "bow tie") {
    
}


class CartItme : Product {
    let quantity :Int!
    init?(name:String,quantity:Int) {
        self.quantity = quantity
        super.init(name: name);
       
        if quantity < 1 {
            return nil
        }
    }
}

//重写可失败构造器
//一个非可失败的构造器永远不能代理一个可失败构造器

class Document {
    var name :String?
    init() {}
    
    init?(name:String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

class AutomatiallyNameDocument : Document {
    override init () {
        super.init()
        self.name = "[Untitled]"
    }
    
    override init(name:String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitle]"
        }else {
            self.name = name;
        }
    }
    
    
}