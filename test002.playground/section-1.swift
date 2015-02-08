// Playground - noun: a place where people can play

//MARK:- 划隔

//FIXME: 隔

import UIKit

///创建一个数组
var arr1 = [1, "two", 3];
var arr2:[Int];

//TODO: 注意
///注意当数组存储不同类型的使用arr1存储的数据类型为NSObject类型

///若想数组存储不同类型的值可以将数组中的类型声明为 NSObject
var arr3:[NSObject] = [];

arr2 = Array(arrayLiteral: 3);

///当数组被定义为固定类型时不能存储其他类型
//arr2 = "three";
println(arr2);


///创建一个字典
var airports1: Dictionary<String, String>;
var airports2 = ["hello world" : "世界 你好", 1:"one"];
var dic3 = Dictionary<Int,Int>();
dic3[1] = 1;


///注意，当字典没有初始化的时候直接修改或添加值时会报错
airports2.updateValue("我的", forKey: "my");
airports2["my"] = "我们";

airports2[1] = "一";

///字典中的updateValue 返回的是字典中原来的值，当不存在时返回 nil
var value = airports2.updateValue("one", forKey: 1);
println(value);

let someCharacter: Character = "3";

/// 注意一： switch 在swift 中不能出现没有可能的情况，当case包括所有的情况后可以省略 default,否则不能省略default
/// 注意二： 和OC、C不一样，swift中switch没有隐式贯穿，及不使用break时一个case只运行内部的代码块
switch someCharacter {
    ///注意当someCharacter 的类型固定时  switch中的case 不能有其他类型的值
//case 3:
//    println("这个字符是数字3");
    ///
case "a", "e", "i", "0", "u" :
    println("字符是元音字符");
    //在Xcode中case 下必须有一个可执行语句，否则报错
//    case "c":
    
default:
    println("其他的可能");
}

var someObject = 3;

//swift中得数值可以用 "_" 隔开 基本没有限制
let i_like_int_value = 1_0_0_0_0_;


switch someObject {
//注意case 使用 数值返回时，只能使用 闭区间的范围符号，，不能使用 “.." 的半闭区间符号
//case 0..999_999:
case 0...999_999:
    println("0 ~ 999,999 的数值");
default:
    println("其他情况");
}

var anotherPoint = (2, 0);
///swift 可以使用值绑定的特性
///下面是例子
///也说明当case 中包含所有的 条件时，可以省略default条件
switch anotherPoint {
case (var x, 0) :
    println("y轴上");
case (0, let y):
    println("x轴上");
    
    ///case 中 可以使用 where 语句添加额外的判断
case (var x, var y) where x == y:
    println("在 y = x 这条线上");
case let (x, y):
    println("不在轴上");
}

//MARK: - 控制转移语句
//swift 语句包括常用的下面三种
//continue
//break
//return


//还包含  Fallthrough
///功能：使满足条件的case 执行完本身的代码后自动落入下一个case 语句的执行语句中，功能和C、OC 中得case 不加break一样， 不会判断下一个case的条件

///定义一个函数返回多个值
func verificationValues(num1:Int, num2:Int, num3:Int) -> (minValue: Int, maxValue:Int) {
    var minValue = min(num1, num2, num3);
    var maxValue = max(num1, num2, num3);
    return (minValue, maxValue);
}

var values = verificationValues(3, 2, 12);
println("min value: \(values.minValue), max value: \(values.maxValue)");

///设置外部参数
func someFunction(externalParameterName localParameterName:Int) {
    
}


someFunction(externalParameterName: 12);

///生成和内容参数一样的外部参数名
func objectFunction(var localParameterName:Int = 0) {
    localParameterName = 9;
}

//TODO: 注意函数的形参默认是 let 常量类型的， 意味着不能直接改变形参的值


func addFunction(var # num1:Int, var num2:Int = 2) {
    
}

addFunction(num1: 20, num2: 3);


func swapTwoNumbers(inout # a:Int, inout # b:Int) {
    a = a^b;
    b = b^a;
    a = b^a;
}

var a = 1, b = 2;

swapTwoNumbers(a: &a, b: &b);
println("a = \(a), b= \(b)");


//MARK: - 闭包
//函数是特殊的闭包
/**
 *  闭包采取如下三种形式之一
 *  1. 全局函数是一个有名字但不会捕获任何值的闭包
 *  2. 嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
 *  3. 闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的没有名字的闭包

*/

//FIXME: 闭包的使用
///实例
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"];

func backwards(s1:String, s2:String) -> Bool {
    return s1 > s2;
}

var reversed = names.sorted(backwards);

//闭包表达式语法有如下一般形式
//{
//    (parameters) -> returnType in
//    statements
//}
//标准形式
reversed = names.sorted(
    {
        (s1:String, s2:String) ->Bool in
        return s1 < s2;
    }
);

//因为排序闭包是作为函数的参数进行传入的，swift可以推断其参数和返回值的类型
//因此实际上 String， String 和 Bool 类型并不需要作为闭包表达式定义中的一部分。因为所有的类型都可以被正确推断
reversed = names.sorted({s1,s2 in return s1 > s2});

//单行表达式闭包可以通过隐藏 return 关键字来隐式返回单行表达式的结果
reversed = names.sorted({s1, s2 in s1 < s2});

//Swift 自动为内联函数提供了参数名称简写功能,您可以直接通过 $0,$1,$2 等名字来引用 的闭包的参数的值
reversed = names.sorted({$0 < $1});

//运算符函数
reversed = names.sorted(<);


let digitNames = [
    0: "zero",   1: "one",  2: "two",   3: "three", 4: "four",
    5: "five",  6: "six",   7: "seven", 8: "eight", 9:"nine"
];

let numbers = [16, 58, 510];

let strings = numbers.map({
    (var number) -> String in
    var output = "";
    while number > 0 {
        output = digitNames[number % 10]! + output;
        number /= 10;
    }
    return output;
});
println(strings);

func someFunctionThatTakesAClosure(closure: () -> ()) {
    //函数体部分
}

//以下是不适用 trailing 闭包进行函数调用
    someFunctionThatTakesAClosure{(
        //闭包主体部分
    )}

//以下是使用 trailing 闭包进行函数调用
someFunctionThatTakesAClosure() {
    //闭包主体部分
    
}

//注意:如果函数只需要闭包表达式一个参数,当您使用 trailing 闭包时,您甚至可以把() 省略掉。

reversed = names.sorted(){$0 < $1}

//使用枚举
enum CompassPoint {
    case North
    case South
    case East
    case West
    case mercury, venus, earth, mars
}

var directionToHead = CompassPoint.North;

directionToHead = CompassPoint.earth;

///当类型明确时可以如下是使用
directionToHead = .venus;

///但类型不明确时，如下使用会报错
//var testDirectionToHead = .mars;

switch directionToHead {
case .North:
    
    fallthrough;
default:
    
    break;
}

//给枚举赋值
enum Barcode {
    //关联值
    case UPCA(Int, Int, Int);
    case QRCode(String);
    case OtherCode(String);
}

var productBarcode = Barcode.QRCode("QRCode");

switch productBarcode {
case .UPCA(let numberSystem, let identifier, let check):
    
    break;
case .QRCode(var productCode):
    
    break;
//当成员类型相同时
case let .OtherCode(otherName):
    
    break;
}

///设置原始值
enum ASCIIControlCharacter : Character {
    case Tab = "\t", lineFeed = "\n";
}

let character = ASCIIControlCharacter.Tab;

enum Planer :Int {
    case Mercury = 1, Venus, Earth, Mars;
}

let earthsOrder = Planer.Earth;

///使用枚举的 rawValue 可以获取枚举成员的原始值
earthsOrder.rawValue

///获取枚举中的值
let passiblePlanet = Planer(rawValue: 3);

//定义一个结构体
struct Resolution {
    var width = 0;
    var height = 0;
}
//定义一个类
class VideoMode {
    var resolution = Resolution();
    var interlaced = false;
    var frameRate = 0.0;
    var name:String? ;
}

let someResolution = Resolution();

let someVideoMode = VideoMode();

//结构体类型的成员逐一初始化器
let vga = Resolution(width: 10, height: 20);

var a1 = [1, 2, 3];
var b1 = a1;
var c = a1;

//a1[0] = 21;
//println(c);
//
//b1[0] = 11;
//println(a1);

if a1 == b1 {
    println("数组a1 和 b1 值相同");
}
var nameList = ["Mohsen", "Hilary"];

struct FixedLengthRange {
    var firstValue: Int;
    let length: Int;
}

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4);


class DateImporter {
    /**
        DateImporter初始化时需要不少时间
    */
    var fileName = "data.txt";
}

///注意：全局的常量或变量都是延迟计算的，跟延迟存储属性相似，不同的地方
class DataManager {
    //延迟存储属性
    lazy var importer = DataManager();
    
    //防止重写
    final var data = [String]();
    
    var name:String = "" {
        willSet(willNewValue) {
            println("willSet:你将要给name赋新值:\(willNewValue)");
        }
        didSet(oldNameValue) {
            println("didSet:name的旧值为:\(oldNameValue)，新值为:\(name)");
        }
    }
    
    //定义类型属性
    class var myName :Int {
        return 1;
    };
    
    func addNumer(num1:Int, num2:Int) ->Int {
        
        return num1 + num2;
    }
    
    init() {
        
    }
    
    deinit {
        
    }
}

struct SomeStucture {
    static var storedTypeProperty = "some value";
    static var computedTypeProperty: Int {
        return 2;
    }
}

enum SomeEnumeration {
    static var StoredTypeProperty = "some value";
    static var computedTypeProperty: Int {
        return 3;
    }
}

var dataManager = DataManager()

dataManager.name = "晨光";

DataManager.myName
SomeStucture.storedTypeProperty;
SomeEnumeration.computedTypeProperty;

dataManager.addNumer(3, num2: 2);

///使用变异修改内部变量
struct Point {
    var x = 0.0, y = 0.0;
    ///使用变异
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        //第一种赋值方法
        x += deltaX;
        y += deltaY
        
        //第二种赋值方法
        self = Point(x: x + deltaX, y: y + deltaY);
    }
}

var somePoint = Point(x: 1.0, y: 1.0);
somePoint.moveByX(2.0, y: 3.0);

struct LevelTracker {
    static var highestUnlockedLevel = 1;
    
    static func unlockLevel (level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level;
        }
    }
    
    static func levelIsUnlocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel;
    }
    
    var currentLevel = 1;
    
    mutating func advanceToLevel (level: Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level) {
            currentLevel = level;
            return true;
        } else {
            return false;
        }
    }
}

//FIXME:附属脚本
struct TimesTable {
    let multiplier: Int;
    
    subscript(index: Int) -> Int {
        return multiplier * index;
    }
}

let threeTimesTable = TimesTable(multiplier: 3);
println("3的6倍是\(threeTimesTable[6])");

