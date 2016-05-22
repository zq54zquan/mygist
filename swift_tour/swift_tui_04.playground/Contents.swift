//: Playground - noun: a place where people can play

import UIKit

//字符串和字符
let someString = "Some string literal value"
var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty {
    print("Nothing to see here")
}

//字符串可变性
var variableString = "Horse"
variableString += " and carriage"
let constantString = "Highlander"
//constantString += " and another Highlander" //常量字符串不可变

//字符串是值类型
for character in "Dog! ".characters {
    print(character,terminator:"")
}

let exlamationMark:Character = "!"
let catCharacters:[Character] = ["C","a","t","!"]
let catString = String(catCharacters)
print(catString)

//连接字符串和字符
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

let exclamationMark:Character = "!"
welcome.append(exlamationMark)

print(welcome)

//字符串插值
let multipiler = 3
let message = "\(multipiler) times 2.5 is \(Double(multipiler)*2.5)"

//unicode标量

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"


let eAcute:Character = "\u{E9}"
let combineAcute:Character = "\u{65}\u{301}"

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"

//计算字符数量
let unusualMenagerie = "Koala Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"

print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")

var word = "cafe"
print("the number of characters in \(word) is \(word.characters.count)")
word += "\u{301}"
print("the number of characters in \(word) is \(word.characters.count)")


word.utf16.count

//访问字符串修改
let greeting = "Guten Tag"
greeting[greeting.startIndex]
greeting[greeting.endIndex.predecessor()]
greeting[greeting.startIndex.successor()]
let index = greeting.startIndex.advancedBy(7)
greeting[index]

for index in greeting.characters.indices {
    print("\(greeting[index])", terminator:" ")
}

//插入和删除
var welcome1 = "hello"
welcome1.insert("!", atIndex: welcome1.endIndex)

welcome1.insertContentsOf(" there".characters, at: welcome1.endIndex.predecessor())


welcome1.removeAtIndex(welcome1.endIndex.predecessor())
let range = welcome1.endIndex.advancedBy(-6)..<welcome1.endIndex

welcome1.removeRange(range)
welcome1.removeAll()

//比较字符串
let quotation = "We're a lot alike , you and I"
let sameQuotation = "We're a lot alike , you and I"
if quotation == sameQuotation {
    print("There two strings are considered equal")
}



