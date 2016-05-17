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




