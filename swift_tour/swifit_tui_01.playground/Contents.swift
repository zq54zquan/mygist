//: Playground - noun: a place where people can play

import UIKit

//定义变量，类型推断
var myVariable = 42
myVariable = 50
let myConst = 42

let  implictInteger = 70
let implictDouble = 70.0 //浮点类型默认是 Double
let explictDouble:Double = 70 //显示定义Double
let explictFloat:Float = 4 //显示定义Float


//定义好的值永远不能被隐式转换 只能显式转换
let label = "The width is"
let width = 94
let widthLabel = label + String(width)
//简单的方式转换成字符串
let apples = 3
let oranges = 5
let  appleSummary = "I have \(apples) apples"
let fruitSummary = "I have \(apples+oranges) pieces of fruit"

let dave = "Dave Carlet"
let  ciao = "ciao mr \(dave)"

//[] 用来创建数组和字典
var shoppingList = ["catdish", "water", "tulips","blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm":"Captain",
    "Kaylee":"Mechanic"
]

occupations["Jayne"] = "Public Relations"
//创建空数组或者空字典
let emptyArray = [String]()
let emptyDictionary = [String:Float]()

//可以推断出类型时可以忽略类型
shoppingList = [] //空数组
occupations = [:] //空字典

//控制流
let individualScores = [75,43,103,87,12]
var teamScore = 0
for score in individualScores {
    if score > 50 { //条件必须是一个bool类型 if score 会编译不过 参数不会与0做比较
        teamScore += 3
    }else {
        teamScore += 1
    }
}


//可选值
var optionalString:String? = " Hello"

print(optionalString == nil)
var optionalName:String? = "John Appleseed"
var greeting = "Hello!"
//optionalName=nil
if let name = optionalName {
    greeting = "Hello , \(name)"
}else {
    greeting = "Hello, nobody"
}

//使用??提供默认值
let nickName:String? = nil
let fullName:String = "John Appleseed"
let informalGreeting = "Hi, \(nickName ?? fullName)" //注意空格

//switch
//每个case字句不需要加上break；
let vegetable = "red pepper"
switch vegetable {
    case "celery":
        print("Add some raisins and make ants on a log.")
    case "cucumber","watercress":
        print("That would make a good tea sandwich")
    case let x where x.hasPrefix("pepper"):
        print("is it a spicy \(x)")
    default:
        print("Everything tastes good in soup")
}


//for-in 遍历字典
let interestingNames = [
    "Prime":[2,3,5,7,11,13],
    "Fibonacci":[1,1,2,3,5,8],
    "Square":[1,4,9,16,25], //最后一个元素后边可以保留逗号
]
var largest = 0
for (kind,numbers) in interestingNames {
    for number in numbers {
        if number>largest {
            largest = number
        }
    }
}
print(largest)

//while
var n = 2
while n < 100 {
    n *= 2
}
print(n)

//repeat 可以保证循环至少执行一次
var m = 2
repeat {
    m *= 2
}while m  < 100
print(m)

var firstForLoop = 0
for i in 0..<4 { //不包含上边界，...包含上边界
    firstForLoop += 1
}
print(firstForLoop)

var secondForLoop = 0
for var i = 0; i < 4; ++i {
    secondForLoop += 1
}
print(secondForLoop)
//函数和闭包
//func 来声明函数
func greet(name:String, day:String) -> String {
    return "Hello \(name), today is \(day)"
}
greet("Bob",day: "Tuesday")
//使用元组来返回对个值
func calculateStatistics(scores:[Int])->(min:Int,max:Int,sum:Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0;
    
    for score in scores {
        if score > max{
            max = score
        }else if (score < min ) {
            min = score
        }
        sum += score
    }
    
    return (min,max,sum);
}
let statistics = calculateStatistics([5,3,100,3,9])
print(statistics.min)
print(statistics.0)
//变长参数
func sumOf(numbers:Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum+=number
    }
    return sum
}
sumOf()
sumOf(42,597,12)
//函数嵌套
func returnFifteen() ->Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
//函数是第一等类型，可以作为一个函数的返回值
func makeIncrementer() -> (Int->Int) {
    func addOne(number:Int) -> Int {
        return 1+number
    }
    return addOne;
}

var increment = makeIncrementer()
increment(7)
//函数可以作为参数
func hasAnyMatches(list:[Int],condition:(Int->Bool)) -> Bool {
    for  item  in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number:Int) -> Bool {
    return number < 10
}

var numbers = [20,19,7,12]
var tribleNumbers:[Int]
hasAnyMatches(numbers, condition: lessThanTen)
//闭包
tribleNumbers = numbers.map( {(number:Int) ->Int in
    let result = 3 *  number
    return result
})

print(tribleNumbers)
//简化，已知类型可以省略
tribleNumbers = numbers.map({
    number in number * 3
})
print(tribleNumbers)
//简化不使用命名的参数，最后参数还可以省略掉（）
tribleNumbers = numbers.map{$0*3}
print(tribleNumbers)

//对象和类
class Shape {
    var numberOfSide = 0
//    let  shapeName:String? //let 常亮必须直接初始化或者必须有一个自定义的构造函数定义
    func simpleDescription() -> String {
        return  "A Shape with \(numberOfSide) sides"
    }
}
var shape = Shape()
shape.numberOfSide = 7
var shapeDiscription = shape.simpleDescription()
//构造函数
class NameShape {
    var numberOfSides : Int = 0
    var name :String //必须有构造函数初始化参数
    
    init(name:String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}
//子类override超类
class Square:NameShape {
    var sideLength : Double
    init(sideLength:Double,name: String) {
        self.sideLength = sideLength //写完自身的属性
        super.init(name: name) //super超类
        numberOfSides = 4 //修改超类的属性
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with side of length \(sideLength)"
    }
}

let test  = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

class  Circle: NameShape {
    var radius : Double
    init(radius:Double ,name: String) {
        self.radius = radius
        super.init(name: name)
        numberOfSides = 1
    }
    
    func area() -> Double {
        return M_PI * radius*radius
    }
    
    override func simpleDescription() -> String {
        return "A circle with radius \(radius)"
    }
}

//计算属性 getter setter 
class EquilateraTriangle : NameShape {
    var sideLength:Double = 0.0
    init(sideLength:Double , name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter : Double {
        get {
            return 3.0 * sideLength
        }
        set(v) {//默认可以使用newValue
            sideLength = v / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "A equilatera Triangle with side of length \(sideLength)"
    }
}

var triangle = EquilateraTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9
print(triangle.sideLength)

//willSetter 和 didSetter
class TriangleAndSquare {
    var triangle:EquilateraTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square:Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size:Double,name:String){
        square = Square(sideLength: size, name: name)
        triangle = EquilateraTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test sample")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "large square")
print(triangleAndSquare.triangle.sideLength)

//枚举和结构体
enum Rank:Int {
    case Ace = 1
    case Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten
    case Jack,Queen,King
    func simpleDiscription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.Ace
let aceRawValue = ace.rawValue;

var rankstr:String = ""
if let convertedRank = Rank(rawValue:3) {
     rankstr = convertedRank.simpleDiscription()
}
print(rankstr)

enum Suit { //可以没有类型
    case Spades,Hearts,Diamonds,Clubs
    func simpleDiscription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case.Clubs :
            return "clubs"
        }
    }
}

let hearts = Suit.Hearts
let heartsDiscription = hearts.simpleDiscription()

struct Card {
    var rank:Rank
    var suit:Suit
    func simpleDiscription() -> String {
        return "The \(rank.simpleDiscription()) of \(suit.simpleDiscription())"
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDiscription();

enum ServerResponse {
    case Result(String,String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failed = ServerResponse.Error("out of cheese")

switch success {
case let .Result(sunrise,sunset):
    let serverResponse = "sunrise is art \(sunrise) and sunset is at \(sunset)"
case let .Error(error):
    let serverResponse = "Failure .... \(error)"
}


//协议和扩展
protocol ExampleProtocol {
    var simpleDiscription:String {get}
    mutating func adjust() //值类型需要使用mutating来标识方法可以修改本身的属性
}

class SimpleClass:ExampleProtocol {
    var simpleDiscription: String  = "A very sample class"
    var anotherProperty:Int = 69105
    func adjust() { //类中的属性默认都是修改属性
        simpleDiscription += " Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDiscription

struct SimpleStructure:ExampleProtocol  {
    var simpleDiscription: String = "A simple structure"
    mutating func adjust() { //结构体中的属性默认是不可以修改的
         simpleDiscription += " (adjust)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDiscription


extension Int : ExampleProtocol{
    var simpleDiscription:String {
        return String(self)
    }
    
    mutating func adjust() {
        return self+=42
    }
}

var x = 7
x.adjust()
x.simpleDiscription

let protocolValue:ExampleProtocol = a
//protocolValue.anotherProperty //编译报错

//泛型
func repeatItem<Item>(item : Item , numberOfItems:Int) -> [Item] {
    var result = [ Item ]()
    for _ in 0 ..< numberOfItems {
        result.append(item)
    }
    return result
}

enum OptionalValue<Wrapped> {
    case  None
    case Some(Wrapped)
}

var possibleInteger:OptionalValue<Int> = .None
possibleInteger = OptionalValue.Some(100)

//where 限定
func anyCommonElements <T:SequenceType, U:SequenceType where T.Generator.Element:Equatable, T.Generator.Element == U.Generator.Element > (lhs:T,rhs:U)  -> Bool{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}

anyCommonElements([12,13,1], rhs: [1])