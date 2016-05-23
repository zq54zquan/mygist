//: Playground - noun: a place where people can play

import UIKit

let base = 3
let power = 10
var answer = 1
for _ in 1...power { //for-in循环 1.参数无需声明，只要在循环的声明中，就会对他进行隐式声明 2. 可以使用_忽略对值的访问
    answer *= base
}

for var index = 0 ; index < 3; index=index+1 { //c样式的for循环需要声明参数 var
    print("index  is \(index)")
}

let finalSquare = 25
var board = [Int](count:finalSquare+1,repeatedValue:0)
board[03] = 08
board[06] = 01
board[09] = 09
board[10] = 02
board[14] = -10
board[19] = -11
board[22] = -02
board[24] = -08

var square = 0
var diceRoll = 0
while square < finalSquare {
    if ++diceRoll == 7 {diceRoll = 1}
    square+=diceRoll
    if square<board.count {
        square += board[square]
    }
}
square = 0
diceRoll = 0
repeat {
    square += board[square]
    if ++diceRoll == 7 {diceRoll = 1}
    square+=diceRoll
    
} while square < finalSquare

//switch
let someCharacter:Character = "e"

switch someCharacter {
case "a","e","i","o","u" :
    print("\(someCharacter) is a vowel") //不存在隐式的贯穿，不需要使用break
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
    "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"://每一个分支都必须有字句，空case会导致编译错误,可以使用break语句代替
    print("\(someCharacter) is consonant")
default:
    print("\(someCharacter) is not a vowal or a consonant")
    
}

//switch 区间匹配
let approxinateCount = 62
let countedThings = "moons orbiting Saturn"
var naturlCount:String
switch approxinateCount {
case 0:
    naturlCount = "no"
case 1..<5:
    naturlCount = "a few"
case 5..<12:
    naturlCount = "several"
case 12..<100:
    naturlCount = "dozens of"
case 100..<1000:
    naturlCount = "hundreds of"
default:
    naturlCount = "many"
}
print("There are \(naturlCount) \(countedThings)")
//switch 元组
let somePoint = (1,1)
switch somePoint {
case (0,0):
    print("(0,0) is at the origin")
case (_,0):
    print("(\(somePoint.0),0) is on the x-aixs")
case (0,_):
    print("(0,\(somePoint.1) is on the y-aixs")
default:
    print("(\(somePoint.0),\(somePoint.1)) is outside of the box")
}
//值绑定
let anotherPoint = (2,0)
switch anotherPoint {
case (let x, 0):
    print("on the x-aixs with x value of \(x)")
case (0,let y) :
    print("on the y-aixs with y value of \(y)")
    guard y == 4 else {
        break
    }
case let (x,y) :
    print("somewhere else at (\(x),\(y))")
}

//where
let yetAnotherPoint = (1,-1)
switch yetAnotherPoint {
case let (x,y) where x == y :
    print("(\(x),\(y)) is on the line x == y")
case let (x,y) where x == -y :
    print("(\(x),\(y)) is on the line x == -y")
case let (x,y):
    print("(\(x),\(y)) is just some arbitrary point")
}


//控制转移
let puzzleInput = "great minds think alike"
var puzzleOutput = ""

for character in puzzleInput.characters {
    switch character {
    case "a","e","i","o","u"," ":
        continue
    default:
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)

//fallthrough 贯穿switch
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2,3,5,7,11,13,17,19:
    description += "a prime number, and also"
    fallthrough //fallthrough 不会判断下一个字句的case是否合适，只是简单的运行下一个case的字句代码
case 9,10:
    description += "haha shan"
default:
    description += "an integer"
}

print(description)

//guard
func greet(person:[String:String]) {
    
    guard let name = person["name"] else { //和if语不同guard语句的绑定参数在语句之后是有效的
       print("ho")
       return //必须调用转移控制语句 退出guard语句出现的代码段，在switch 循环中使用break，循环中还可以使用continue
    }
    
    print("Hello \(name)")
    
    guard let location = person["location"] else {
        print("i hope the weather is nice near you")
        return
    }
    
    print("i hope the weather is nice in \(location)")
}

greet(["name":"John"])
greet(["name":"Jane", "location":"Cupertino"])

//API 可用性 替换deviece systemvalue
if #available(iOS 9,  *) {//在iOS9及以上系统可以运行， *是必须的，表示用于处理未来潜在平台
}
