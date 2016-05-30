//: Playground - noun: a place where people can play

import UIKit

//继承


class Vehicle {
    var currentSpeed = 0.0
    var description:String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        //subclass implement this
    }
}

let someVehicle = Vehicle()

print(someVehicle.description)

class Bicyle:Vehicle {
    var hasBasket = false
}

let bicyle = Bicyle()
bicyle.hasBasket = true
bicyle.currentSpeed = 15.0

print(bicyle.description)

class Tandem: Bicyle {
    var currentNumberOfPassagers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassagers = 2
tandem.currentSpeed = 22.0
print(tandem.description)

//重写
class Train:Vehicle {
    override func makeNoise() {
        print("Choo, Choo")
    }
}

let train = Train()
train.makeNoise()

//重写属性
//不可以将一个读写属性重写成ready-only属性
//可以将只读属性重写rw属性
class Car:Vehicle {
    var gear = 1
    override var description: String {
        return super.description + "in gear \(gear)"
    }
}

let car  = Car()
car.currentSpeed = 25.0
car.gear = 3
print("car : \(car.description)")

//重写property观察器
class AutomaticCar:Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed/10.0)+1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar:\(automatic.gear)")



//阻止重写
//在属性或方法声明是final var 
//在类前使用finnal class