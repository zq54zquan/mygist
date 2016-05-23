//: Playground - noun: a place where people can play

import UIKit
//函数
func sayHello(personName:String) -> String {
    let greeting = "Hello, " + personName + "!"
    return greeting
}

print(sayHello("Brain"))

func sayHelloAgain(personName:String) -> String {
    return "Hello Again " + personName + "!"
}

print(sayHelloAgain("Brain"))

func sayHello(personName:String,alreadyGreeted:Bool) -> String {
    if alreadyGreeted {
        return sayHelloAgain(personName)
    }
    else {
        return sayHello(personName);
    }
}

print(sayHello("Tim", alreadyGreeted: true)) //调用时第一个参数省略外部名，后边的参数使用局部参数名作为外部参数名

//多重返回函数
func minMax(array:[Int]) -> (min:Int,max:Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value > currentMax {
            currentMax = value
        }else if value < currentMin{
            currentMin = value
        }
    }
    
    return (currentMin,currentMax)
}

let bounds = minMax([8,-6,2,109,3,71])
print("min is \(bounds.min) and max is \(bounds.max)") //元组成员名族在函数返回时类型中指定了

//可选元组返回类型
func minMax1(array:[Int]) -> (min:Int,max:Int)? {
    if array.isEmpty {
        return nil
    }
    
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if currentMax<value {
            currentMax = value;
        }else if currentMin>value {
            currentMin = value
        }
    }
    return (currentMin,currentMax)
}

let a1 = [Int]()
minMax1(a1)


//参数名
func sayHello(to person:String, and anotherPerson:String) -> String { //重新定义外部参数名，在函数内部还是使用局部变量名作为参数
    
    return "Hello \(person) and \(anotherPerson)"
}

func sayHello(person:String, _ greet:String) -> String { //不想使用外部名就指定_作为外部参数名
    return "Hello " + person + " \(greet)"
}


print(sayHello("Bill", "nobody"))


print(sayHello(to: "Bill", and: "Ted")) //指定外部参数名后，调用时外部参数名必须都写


//默认参数
func someFunction(parameterWithDefault:Int = 2) {
    print("\(parameterWithDefault)")
}

someFunction()
someFunction(3)

//可变参数

func  arithmeticMean(numbers:Double...) -> Double { //一个函数最多只能有一个可变参数
    var total:Double = 0
    for number in numbers {
        total += number
    }
    return total
}

//如果函数带默认值参数，还有可变参数，可变参数放在参数列表的最后
func baseAddtion(base:Double = 0.5 ,numbers:Double...) -> Double {
    var total = base;
    for number in numbers {
        total += number
    }
    return total
}
arithmeticMean(1,2,3,4,5) //可变参数
baseAddtion(2, numbers: 1,22,33)
//常量参数和变量参数
//函数才能使默认是常量，在函数中试图修改参数值会导致编译错误
func allRight(var string:String, totalLength:Int,pad:Character)->String {
    let amountToPad = totalLength - string.characters.count
    if amountToPad < 1 {
        return string
    }
    let padString = String(pad)
    for  _ in 1...amountToPad {
        string = padString + string
    }
    return string;
}//参数的修改在函数调用结束后就消失了，对函数外是不可见的，变量参数仅仅存在于函数调用的生命周期内


//输入输出参数
//只能给in-out变量传递变量，常量和字面量都是不合法的，in-out参数不能有默认值，in-out参数不能用let,var标记
func swapTwoInt(inout a:Int , inout _ b:Int) {
    let temporaryA = a;
    a = b;
    b = temporaryA;
}

var someInt = 3
var anotherInt = 107
swapTwoInt(&someInt, &anotherInt)
print("\(someInt) \(anotherInt)")

//函数类型
var mathFunction:(Int,Int)->Int ;
//函数类型作为参数类型
func printMathResult(mathFunction:(Int,Int)->Int, _ a:Int, _ b:Int) {
    print("result:\(mathFunction(a,b))")
}

//函数作为返回类型
func stepForward(input:Int) -> Int {
    return input+1
}

func stepBackward(input:Int) -> Int {
    return input - 1
}

func chooseStepFunction(backWord:Bool) -> (Int)->Int {
    return backWord ? stepBackward : stepForward
}

var currentValue = 3
let moveNearToZero = chooseStepFunction(currentValue>0)

//嵌套函数

func chooseStepFunction1(backWard:Bool) -> (Int)->Int {
    func stepForward(input:Int)->Int {
        return 1 + input;
    }
    
    func stepBackward(input:Int) -> Int {
        return -1 + input
    }
    
    return backWard ? stepBackward : stepForward
}




