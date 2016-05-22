//: Playground - noun: a place where people can play

import UIKit

var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items")
someInts.append(3)
someInts = []

var threeDoubles = Array<Double>(count: 3, repeatedValue: 0.0)
//var threeDoubles1 = [Double](count:3,repeatedValue:0.0)

var anotherThreeDoubles = Array(count:3 , repeatedValue:2.5)
var sixDoubles = threeDoubles+anotherThreeDoubles

var shoppingList:[String] = ["Eggs","Milk"]
var shoppingList1 = ["Eggs","Milk"]

//修改访问数组
print("The shopping list contains \(shoppingList.count) items")
if shoppingList.isEmpty {
    print("The shopping list is empty")
}else {
    print("The shopping list is not empty")
}

shoppingList.append("Flour")
shoppingList += ["Flower"]
var firstItem = shoppingList[0]
shoppingList[0] = "Six Eggs"
shoppingList[1...2] = ["Bananas","Apples"]
print(shoppingList)
shoppingList.insert("Maple Syrup", atIndex: 0)
let mapleSyrup = shoppingList.removeAtIndex(0)

let flower = shoppingList.removeLast()

//遍历数组
for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerate() {
    print("Item \(String(index+1)): \(value)")
}

//set
var letters = Set<Character>()
print("letters is type of Set<Character> with \(letters.count)")
letters.insert("a")
letters = []

var favoriteGenres:Set<String> = ["Rock", "Classical","Hiphop"]
var favoriteGenres1:Set = ["Rock","Classical", "Hiphop"] //可以从数组推断出泛型类型， 但是Set类型必须显示声明
print("I have \(favoriteGenres.count) favorite music genres")

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky")
}else {
    print("I have particular music preferences")
}

favoriteGenres.insert("Jazz")

if let movedGenre = favoriteGenres.remove("Rock") {
    print("\(movedGenre)? I'm over it.")
}else {
    print("I never much care for that")
}

if favoriteGenres.contains("Funk") {
    print("I get up on good foot")
}else {
    print("It's too funky in here")
}


for genre in favoriteGenres {
    print("\(genre)")
}


for genre in favoriteGenres.sort() {
    print("\(genre)")
}

//集合操作
let oddDigist:Set = [1,3,5,7,9]
let evenDigist:Set = [0,2,4,6,8]
let singleDigitPrimeNumbers:Set = [2,3,5,7]


oddDigist.union(evenDigist).sort()
oddDigist.intersect(evenDigist).sort()
oddDigist.subtract(singleDigitPrimeNumbers).sort()
oddDigist.exclusiveOr(singleDigitPrimeNumbers).sort()

//集合关系
let houseAnimals:Set = ["dog","cat"]
let farmAnimals:Set = ["cow","checken","sheep","dog","cat"]
let cityAnimals:Set = ["bird","rats"]
houseAnimals.isSubsetOf(farmAnimals)
farmAnimals.isSupersetOf(houseAnimals)
farmAnimals.isDisjointWith(cityAnimals)

//字典
var namesOfInteger = [Int:String]()
namesOfInteger[16] = "sixteen"
namesOfInteger =  [:]

var airports:[String:String] = ["YYZ":"Toronto Pearson","DUB":"Dublin"]
print("the dictionary of the airports contains \(airports.count) items")

if airports.isEmpty {
    print("The airports dictionary is empty")
}else {
    print("The airports dictionary is not empty")
}

airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"

if let oldValue = airports.updateValue("Dubin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue)")
}

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName)")
}else {
    print("The airport is not in the airports dictionary")
}

airports["APL"] = "Apple Internation"
airports["APL"] = nil
airports

if let removedValue = airports.removeValueForKey("DUB") {
    print("The removed airport's name is \(removedValue)")
}

for (airportCode,airportName) in airports {
    print("\(airportCode):\(airportName)")
}

for airportCode in airports.keys {
    print("Airport code :\(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}


let airportCodes = [String](airports.keys)

