//: Playground - noun: a place where people can play

import UIKit

//构造过程

//存储属性的初赋值
//设置默认值或者init方法中赋值不会触发监听器


struct Fahrenheit {
    var temperature:Double = 32.0
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()

struct Celsius {
    var temperatureInCelsius:Double
    init(formFahrenheit fahrenheit:Double) {
        temperatureInCelsius = (fahrenheit-32.0)/1.8
    }
    
    init(fromKelvin kelvin:Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    
    init(_ celsius:Double) { //隐藏参数
        temperatureInCelsius = celsius
    }
}

let bollingPointOfWater = Celsius(formFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
let bodyTemperature = Celsius(37.0)


struct Color {
    let red,green,blue:Double
    init(red:Double,green:Double,blue:Double) {
        self.red = red;
        self.green = green
        self.blue = blue
    }
    
    init(white:Double) {
        red = white
        green = white
        blue = white
    }
}

let magenate = Color(red: 1.0, green: 0.0, blue: 1.0)

let halfGray = Color(white: 0.5)


//可选值
class SurveyQuestion {
    var text:String
    var response:String?
    init(text:String) {
        self.text = text
    }
    
    func ask()  {
        print(text)
    }
}


class ShoppintListItem {
    var name:String?
    var quantity = 1
    var purcahsed:Bool = true
}


