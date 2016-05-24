//: Playground - noun: a place where people can play

import UIKit
//闭包
let names = ["Chris","Alex","Ewa","Barry","Daniella"]
//用普通方法实现sort
func backwards(s1:String,s2:String) -> Bool {
    return s1>s2
}

var reversed = names.sort(backwards)
//闭包实现
reversed = names.sort({(s1:String,s2:String)->Bool in s1>s2})
print(reversed)
//闭包类型推断
reversed = names.sort({s1,s2 in return s1 > s2})

//单表达式的闭包隐式返回
reversed = names.sort({s1,s2 in s1 > s2}) //闭包只有一句表达式 可以省略return

//参数名缩写
reversed = names.sort({$0>$1})
//运算符函数
reversed = names.sort(>)
//尾随闭包
reversed = names.sort(){$0>$1}
//如果函数只需要闭包这一个参数可以省略()
reversed = names.sort{$0>$1}

names.map{$0+"12"}

let digitNames = [0:"zero",1:"one",2:"two",3:"three",4:"four",5:"five",6:"six",7:"seven",8:"eight",9:"nine"]
let numbers = [16,58,510]
let strings = numbers.map { (var number) -> String in
    var output = ""
    while number>0 {
        output = digitNames[number%10]! + output
        number /= 10
    }
    return output
}
//捕获值
func makeIncreator(forIncrement amount:Int) -> () -> Int {
    var runingTotal = 0
    func incrementor() -> Int
    {
        runingTotal += amount
        return runingTotal
    }
    return incrementor;
}

let incrementByTen = makeIncreator(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncreator(forIncrement: 7)
incrementBySeven()

//闭包是引用类型
let anotherIncrementByTen = incrementByTen;
anotherIncrementByTen()
//非逃逸闭包

var completionHandlers:[()->Void] = []
func someFunctionWithEscapingClosure(@noescape completionHandler:()->Void ) {
//    completionHandlers.append(completionHandler) completionHandler的生命周期超过了这个方法。所以使用@noescape是不可以的
    completionHandler();
}
//使用@noescape的闭包可以在闭包内隐式的使用self
class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { 
            self.x = 10
        }
        someFunctionWithEscapingClosure{ x = 100 } //隐式的使用了self， 如果不使用必须显示指定self
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
completionHandlers.first?()
print(instance.x)

//自动闭包
var customersInLine = ["Chris","Alex","Ewa","Barry","Daniella"]
print(customersInLine.count)

let customerProvider = {
    customersInLine.removeAtIndex(0)
}

print(customersInLine.count)
print("Now serving \(customerProvider())")
print(customersInLine.count)

func serveCustomer(@autoclosure customerProvider:()->String) {//@autoclosure暗含了noescape如果想要闭包可以逃逸使用@autoclosure(escaping)
    print("Now serving \(customerProvider())")
}
//serveCustomer({ customersInLine.removeAtIndex(0) })
serveCustomer(customersInLine.removeAtIndex(0))




