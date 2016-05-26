//: Playground - noun: a place where people can play

import UIKit

//方法

//实例方法
class Counter {
    var count:Int = 0
    func increase() {
        ++count
    }
    
    func increaseBy(amount:Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}


let counter = Counter()
counter.increase()

counter.increaseBy(5)

counter.reset()

class Counter1 {
    var count = 0
    func increaseBy(amount:Int, numberOfTimes:Int) {
        count += numberOfTimes*amount
    }
}

let counter1 = Counter1()
counter1.increaseBy(2, numberOfTimes: 2)

//self属性
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOfX(x:Double)->Bool {
        return self.x>x
    }
}

let somePoint =  Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(1.0) {
    print("The point is to the right of the line where x = \(somePoint.x)")
}


//mutating变异
//mutating方法可以修改self
struct Point1 {
    var x = 0.0,y = 0.0
    mutating func moveByX(deltaX:Double,y DeltaY:Double) {
        x += deltaX
        y += DeltaY
        self = Point1(x:x,y:y)
        
    }
}

var somePoint1 = Point1(x: 1.0, y: 1.0)
somePoint1.moveByX(2.0,y:3.0)


enum TriStateSwitch {
    case Off,Low,High
    mutating func next() {
        switch self {
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case.High:
            self = .Off
        }
    }
}

//类型方法
struct LevelTrace {
    static var highestUnlockLevel = 1
    static func unlockLevel(level:Int) {
        if level > highestUnlockLevel {
            highestUnlockLevel = level
        }
    }
    
    static func levelIsUnlocked(level:Int)->Bool {
        return level<=highestUnlockLevel
    }
    
    var currentLevel = 1
    mutating func advanceToLevel(level:Int)->Bool {
        if LevelTrace.levelIsUnlocked(level) {
            currentLevel = level
            return true
        }else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTrace()
    let playerName:String
    func completedLevel(level:Int){
        LevelTrace.unlockLevel(level+1)
        tracker.advanceToLevel(level+1)
    }
    
    init(name:String) {
        playerName = name;
    }
}
