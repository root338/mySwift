//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var intArr:Array<Int>

var intArr_001 = Array<Int>()

intArr = Array<Int>();

intArr_001.append(0)

intArr_001.insert(1, atIndex: 1)

//intArr_001.extend(0)

intArr_001.first

var floatArr = [1.0, 2.0, 3.0]

var optionStringArr : [String]?

optionStringArr = Array<String>()


intArr_001 += [3]

intArr_001

intArr_001[0...1] = [1, 2]



intArr_001.append(4)

intArr_001[0...2] = [1]



for (index, value) in enumerate(intArr_001) {
    index
    value
}

var StringArr = Array(count: 3, repeatedValue: 0)
count(StringArr)


var test_set_001 : Set<Int> = [0, 1, 1]
test_set_001.insert(2)
test_set_001.remove(-1)
test_set_001.remove(0)
test_set_001.contains(-1)
test_set_001

for value in sorted(test_set_001) {
    value
}

var test_set_002 : Set<Int> = [];

var test_dic_001 : Dictionary<Int, Int> = [:]
var test_dic_002 = Dictionary<String, Int>()
var test_dic_003 = [1:1]
test_dic_003[2] = 2;
test_dic_003

test_dic_003.updateValue(3, forKey: 3)
test_dic_003
test_dic_003.updateValue(5, forKey: 1)
test_dic_003
count(test_dic_003)

for i in 0...1 {
    
}

let constant_string = " v "

switch constant_string {
case "a" :
    println("a")
    fallthrough
case " " :
    println("null")
case let value where count(value) > 2:
    println("字符串 长度大于 2")
    
case var y :
    println("未知")
    y = "hello"
    constant_string
}

//var variable_int = 0;
//loop: while true {
//    
//    switch variable_int {
//    case 0...9 :
//        
//        println("\(variable_int) 是个位数")
//    case 10...99 :
//        
//        println("\(variable_int) 是两位数")
//        
//    case 100...999:
//        
//        println("\(variable_int) 是三位数")
//        println("退出当前 switch")
//        break
//    case 1000...9999:
//        println("\(variable_int) 是四位数")
//        println("循环即将退出")
//        break loop
//    default:
//        
//        println("\(variable_int) 是没有的数")
//    }
//    
//    variable_int++
//    
//}

func halfOpenRangeLength(start: Int, end: Int) -> Int {
    return end - start
}

func intWithString(#paramString: String) ->Int?
{
    return paramString.toInt()
}

halfOpenRangeLength(1, 10);

intWithString(paramString: "hello world")
intWithString(paramString: "1")


func defaultWithCity(newCityName: String?, defaultCity: String = "北京") ->String {
    
    if let tmpStr = newCityName {
        return newCityName!;
    }else {
        return defaultCity;
    }
}

//defaultWithCity(newCityName: nil)
//defaultWithCity(newCityName: "河北")
defaultWithCity(nil)

//MARK:- 注意： 一个函数至多能有一个可变参数，而且它必须是参数表中最后的一个。这样做是为了避免函数调用时出现歧义。
func sumNumber(#nums: Int...) ->Int
{
    var sum = 0;
    for num in nums {
        sum += num;
    }
    return sum;
}

sumNumber(nums: 1, 2, 3, 4, 5)

//函数参数默认为常量，可以显示的声明为变量，但该变量的修改不影响实参
func stringAlign(var # string: String) {
    string
    string = "";
    println(string)
}

let string_let_fun = "好哈"
stringAlign(string: string_let_fun)
string_let_fun

//MARK:-输入输出参数,当函数形参声明为 inout 时，将对实参进行更改 实参前缀需要"&"符号，且实参不能为常量或字面量
func swapTwoInts(inout a:Int, inout b:Int) {
    a ^= b
    b ^= a
    a ^= b
}

var a = 10, b = 5
swap(&a, &b)
a
b

//MARK:- 使用函数类型
var swapTaoIntsFunction_value : (inout Int ,inout Int) -> Void = swapTwoInts

swapTaoIntsFunction_value(&a, &b)
a
b

//MARK: - 函数形参为 函数类型
func swapTwoWithInts(functionValue: (Int...) ->Int, value1: Int, value2: Int) {
    functionValue(value2)
}

//MARK: - 函数返回值为函数类型
//func swapTwo(value1: Int, value2: Int) -> ((Int, Int) ->Int) {
//    
//
//}

//MARK: - 闭包
var names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"];

//闭包类型一
func backwards(s1: String, s2: String) ->Bool {
    return s1 < s2
}

var newNames = sorted(names, backwards)
newNames

//闭包类型二
newNames = sorted(names, {
    (s1, s2) ->Bool in
        return s1 > s2
});
newNames

//当类型都可以推断时可以简化
newNames = sorted(names, {s1, s2 in return s1 < s2})
newNames

//单表达式闭包可以隐藏return，隐式返回但表达式结果
newNames = sorted(names, {s1, s2 in s1 > s2})
newNames

//swift 自动为内联函数提供参数名称缩写功能 $0, $1, ...
//这样可以省略参数的定义，并且可以省略 in 关键字
newNames = sorted(names, {$0 < $1})
newNames

//运算符函数
newNames = sorted(names, >)
newNames

//尾随闭包
newNames = sorted(names){ $0 < $1 }
newNames

//MARK: - 枚举
enum Enum_Test {
    case One, Two, Three
}

var test_enum_value = Enum_Test.One;
switch test_enum_value {
case .One:
    println("one")
case .Two:
    println("two");
default :
    println("other value")
}

enum Barcode {
    case UPCA(numberSystem: Int, Int, Int)
    case QRCode(String)
}

var productBarcode = Barcode.UPCA(numberSystem: 8, 85909_51226, 3)
productBarcode = .QRCode("ABCEDEGODFDLFJD")

enum Planet: Int {
    case Mercury = 1, Venus, Earth = 5
}

let possiblePlanet = Planet(rawValue: 5)
if possiblePlanet == nil {
    println("没有相应枚举值")
}

//MARK: - 结构体、类
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

var resolution = Resolution(width: 4, height: 9)
var videoMode = VideoMode()
