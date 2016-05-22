//: Playground - noun: a place where people can play


//常量和变量
let maximumNumberOfLogiAttempts = 10//不需要改变的值用let表示
var currentLogicAttempts = 0

var x = 0.0,y = 0.0, z = 0.0

var welcomeMessage:String
welcomeMessage = "Hello"

var red,green,blue:Double

//变量常量的命名
let 你好 = "你好世界"
let `let` = "keyword"
print(`let`)

var friendlyWelcome = "hello"
friendlyWelcome = "Bonjour"

let  languageName = "swift"
//languageName = "swift++"

print("the current value of firendlyWelcome is \(friendlyWelcome)")

let cat = "cat"; print("cat") //同一行超过一个表达式用分号分开

let minValue = UInt8.min;
let maxValue = UInt32.max



let anotherPi = 3+0.14159 //Double 3本身没有类型，在编译的时候编译器可以推断他为double类型所以不需要转换成double

//数值类型字面量
//整数
let decimalInteger = 17
let binaryInteger = 0b1001
let octalInteger = 0o21
let hexAdecimalInteger = 0x11
//浮点数
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xc.3p0 //(12+3*1/16)*2^0

let paddedDouble = 000123.456
let onMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

//数值类型转换
//let cannotBeNegative:UInt8 = -1
//let tooBig:Int8 = Int8.max+1 

let twoThousand:UInt16 = 2_000
let one:UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine

let integerPi = Int(pi)


//类型别名
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

//布尔值
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips")
}else {
    print("Eww, turnips are horrible");
}

let i = 1
//if i {

//}

if i == 1 {
    
}

//元组
let http404Error = (404,"Not Found")
let(statusCode,statusMessage) = http404Error
print("the status code is \(statusCode)")
print("the status message is \(statusMessage)")

let (justTheStatusCode,_) = http404Error
print("the status code is \(justTheStatusCode)")

print("The status code is \(http404Error.0)")

print("The status message is \(http404Error.1)")

let http200Status = (statusCode:200,description:"OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")

//可选类型
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

var serverResponseCode:Int? = 404
serverResponseCode = nil
var surveyAnswer:String? //可选变量或常量不赋值。默认 = nil

//if以及强制解析
if convertedNumber != nil {
    print("convertedNumber contains some integer value")
}

if convertedNumber != nil {
    print("convertedNumber has a integer value of \(convertedNumber!)")
}
//可选绑定
if let actualNumber = Int(possibleNumber) {
    print("\(possibleNumber) has an integer value of \(actualNumber)")
}else {
    print("\'\(possibleNumber) could not be converted to an integer")
}

//where 字句
if var firstNumber = Int("4"), secondNumber = Int("42") where firstNumber < secondNumber {
    print("\(firstNumber) < \(secondNumber)")
}

//隐式解析可选类型
let possibleString:String? = "A optional string"
let forcedStrig:String = possibleString! //使用！来获取值

let assumedString:String! = "An implictly unwrapped optional string"
let implictString:String = assumedString


if assumedString != nil {
    print(assumedString)
}

if let definiteString = assumedString {
    print(definiteString)
    print(assumedString)
}

//错误处理
func canThrowAnError() throws {
    
}

do {
    try canThrowAnError()
}catch {
    
}

//断言
let age = -3
//assert(age>=0, "A person's age cannot be less than zero")




        