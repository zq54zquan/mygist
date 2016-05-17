//: Playground - noun: a place where people can play
import UIKit
//1.Currying
func  addTwoNumbers(a:Int)(num:Int) -> Int{
    return a+num;
}

var s = addTwoNumbers(3)(num: 2)

let addTwoFour = addTwoNumbers(3);

func greaterThan(comparor:Int)(input:Int) -> Bool {
    return input>comparor
}

let greaterThan10 = greaterThan(10);
greaterThan10(input: 9)
greaterThan10(input: 13)


protocol TargetAction {
    func performAction()
}

struct TargetActionWrapper<T:AnyObject>:TargetAction {
    weak var target:T?
    let action:(T)->()
    func performAction() {
        if let t = target {
            action(t)
        }
    }
}

enum ControlEvent {
    case TouchUpInside
    case ValueChanged
}

class Control {
    var actions = [ControlEvent:TargetAction]()
    func setTarget<T:AnyObject>(target:T,action:(T)->(),controlEvent:ControlEvent) {
        actions[controlEvent] = TargetActionWrapper(target:target,action:action)
    }
    
    func removeTargetForControlEvent(controlEvent:ControlEvent) {
        actions[controlEvent] = nil;
    }
    
    func performActionForControlEvent(controlEvent:ControlEvent) {
        actions[controlEvent]?.performAction();
    }
}

//2.将protocol的方法声明为mutating 因为struct和enum是不能改变自己的成员的
protocol Vehicle {
    var numberOfWheels:Int {get}
    var color:UIColor {get set}
    
    mutating func changeColor()
}

struct MyCar:Vehicle {
    let numberOfWheels = 4
    var color = UIColor.blueColor()
    mutating func changeColor() {
        color = UIColor.redColor();
    }
}

//3.sequence
//实现一个反向的sequence
class ReverseGenerator:GeneratorType {
    typealias Element = Int
    var counter:Element
    init<T>(array:[T]) {
        self.counter = array.count-1
    }
    
    init(start:Int) {
        self.counter = start
    }
    
    
    func next() -> Element? {
        return self.counter < 0 ? nil : counter--
    }
}

struct ReverseSequence<T>:SequenceType {
    var array:[T]
    init(array:[T]) {
        self.array = array
    };
    
    typealias Generator = ReverseGenerator
    func generate() -> Generator {
        return ReverseGenerator(array:array)
    }
}

let arr = [0,1,2,3,4]
for i in ReverseSequence(array:arr) {
    print("Index \(i) is \(arr[i])")
}

//5.@autoclousure和？？
//普通闭包
func logIfTrue( predicate:()->Bool ) {
    if predicate() {
        print("true")
    }
}

logIfTrue({return 1>2})
logIfTrue{1>2}
//logIfTrue(1>2) 报错，不能使用bool值替换一个方法参数
func logIfTrue1(@autoclosure predicate:()->Bool) {
    if predicate() {
        print("true")
    }
}

logIfTrue1(1>2) //使用autoclousure可以把表达式自动转换传方法
//autoclousure 不支持带有参数的写法 就是只支持()->T的参数传才能进行简化

var level:Int?
var startLevel = 1
var currentLevel = level ?? startLevel //？？表示如果左边可选值是nil,就使用右边的值作为返回，注意空格

//6.optional chain
class Toy {
    let name:String
    init(name:String) {
        self.name = name
    }
}

class Pet {
    var toy:Toy?
}

class Child{
    var pet:Pet?
}

extension Toy {
    func play() {
        print("hellp")
    }
}

let playClousure = {(child:Child)->() in child.pet?.toy?.play()}
var xiaoming = Child()
var pet = Pet()
var toy = Toy(name:"bong")

xiaoming.pet = pet
pet.toy = toy
playClousure(xiaoming)

//7.操作符

//1.重载已定义的运算符
struct Vector {
    var x = 0.0
    var y = 0.0
}

func +(left:Vector,right:Vector) -> Vector{
    return Vector(x:left.x+right.x,y:left.y+right.y)
}
prefix func -(v:Vector) -> Vector{
    return Vector(x:-v.x,y:-v.y);
}

let v1 = Vector(x:3,y:3)
let minusv1 = -v1;

let v2 = Vector(x:2,y:2)

let v3  = v1+v2

print("v3  \(v3.x):\(v3.y)")

print("-v1  \(minusv1.x):\(minusv1.y)")

//2.定义一个不存在的运算符，需要对新的运算符先进行声明
infix operator +* { //infix 表示定义的是一个中位运算符，前后都是输入 prefix表示前缀运算发，postfix表示后缀运算符
    associativity none //定义结合性, 表示同类的运算符对个出现时的运算顺序 left:左结合 right:右结合 none:表示不能同时出现同样的运算符?
    precedence 160 //表示运算的优先级 越大越优先计算，默认的乘除法是150 加减法是140
}

func +*(left:Vector,right:Vector) -> Double {
    return left.x*right.x + left.y*right.y
}


print("\(v1+*v2)")
//8.func的修饰符
func increamentor(variale:Int) ->Int {
    //return ++variale; //方法参数默认是不可变的。默认参数其实都是用let初始化的
    //方法声明等效于
    //func increamentor1(let variale:Int) -> Int
    return variale+1;
}

func increamentor1(var variable:Int) -> Int {
    return ++variable;
}

var x = 9
increamentor1(x)
print("\(x)") //var作为方法参数只在方法内部起作用,调用完方法实参保持原样，相当于按值传递了参数

func increamentor2(inout variable:Int) -> Int {//按引用传递，在方法内直接改变实参的值
    return ++variable;
}

var y = 9
increamentor2(&y); //调用时使用取引用符号
print("\(y)")


func makeIncreamentor(numtoadd:Int)->((inout variable:Int)->Int) {
    func increamentor(inout va:Int) -> Int {
        va+=numtoadd
        return va;
    }
    return increamentor;
}

//9.字面值的转换
extension Vector:BooleanLiteralConvertible {
   init(booleanLiteral value: Bool) {
        if(value) {
            self = Vector(x:1,y:1)
        }else {
            self = Vector(x:0,y:0)
        }
    }
}

var origin:Vector = true

print(origin)

//10.下标

extension Array {
    subscript(input:[Int])->ArraySlice<Element> {
        get {
            var result = ArraySlice<Element>();
            for i in input {
                assert(i<self.count,"INDEX OUT OF RANGE")
                result.append(self[i])
            }
            return result
        }
        
        set {
            for (index,i) in input.enumerate() {
                assert(i < self.count, "INDEX OUT OF RANGE")
                self[i] = newValue[index]
            }
        }
    }
}


var arr1 = [1,2,3,4,5]
arr1[[0,2,3]]
arr1[[0,1,2]] = [8,9,10]
arr1