// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var width = 94;
let widthLable = str + String(width);
println("\(width)");

///定义一个函数
func add(num1: Int, num2: Int) -> Int {
    return num1 + num2;
}

///使用元组返回多个值
func compareMinAndMax(num1: Int, num2: Int, num3: Int) -> (Int, Int) {
    return(min(num1, num2, num3), max(num3, num2, num1));
}

///创建一个可变的参数，用数组获取它们
func sumOf(numbers: Int...) -> Int {
    var num = 0;
    for number in numbers {
        num += number;
    }
    return num;
}

///返回一个函数
func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number;
    }
    return addOne;
}

var increment = makeIncrementer();
increment(3);

///传入一个函数
func hasAnyMatches(strlen: ((String, String) -> String), length: Int) -> Void {
    var newString = strlen("hello", " world");
    var newLength = newString.lengthOfBytesUsingEncoding(NSUTF8StringEncoding);
    println(newLength - length);
}

func strlen (str1: String, str2: String) -> String {
    return str1 + str2;
}

hasAnyMatches(strlen, 4);

///定义一个类
class NamedShape {
    var numberOfSides: Int = 0;
    var name: String;
    
    init(name: String) {
        self.name = name;
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides";
    }
}

var shape = NamedShape(name: "hello world");
shape.name.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) - 10;

///继承一个类
class Circle : NamedShape {
    var age: Int;
    init(name: String, age: Int) {
        self.age = age;
        super.init(name: name);
        numberOfSides = 4;
    }
    override func simpleDescription() -> String {
        return "Circle print ...";
    }
    
    var gerimeter : Double {
        get {
            return 0.1;
        }
        
        set {
            numberOfSides = (Int)(newValue / 3.0);
        }
    }
    
    func incrementBy(amount: Int, numberOfTimes times: Int) -> Int {
        return amount + times;
    }
}

var circle = Circle(name: "chenguang", age: 23);
println(circle.incrementBy(12, numberOfTimes: 14));

///当一个个类型的数据超出其最大值时程序会报错，而不会像c、oc一样数据溢出
///例如:
//var uint8_max: UInt8 = UInt8.max + 1;

///swift 整形数据与浮点数相加时需要转换其类型后再进行数学运算，否则会报错
///例如:
var test_int : Int = 4;
///错误使用方式  不想c、oc一样会隐式类型转化为浮点数进行数学运算
//var test_float = 3.2 + test_int;
///正确的使用方式
var test_float = 3.2 + Float(test_int);


var u_test001: UInt8 = UInt8.max;

///声明类别
typealias AudioSample = UInt16;

var maxAmplitudeFound: AudioSample = 10;

var i = 1;

//MARK: - IF需要注意的地方
//TODO: 注意
///swift 中if 语句的判断条件只能加入boolean类型，而不能加入其他类型，它不会像C、OC一样将其他类型隐式转换为boolean类型
//if i {}

///可以如下使用
if i == 1 {}

///声明一个元组
let http404Error = (404, "Not Found");

///声明一个元组，并设置变量名
var (httpErrorCode: Int, httpErrorDomain: String) = http404Error;

///之后就可以直接使用
let errorCode = httpErrorCode;
let errorDomain = httpErrorDomain;

//FIXME: - BUG
///当只需要元组一个值得时候可以使用 “_” 忽略其它值, 需要哪个就为对应的值添加变量名，其它的都是用 "_" 就可以了，必须保证一一对应的关系
let (justTheStatusCode, _) = http404Error;

///注意的地方
let httpDetailError = (404, "Not Found", "没有找到");
let (_justTheStatusCode, _, _) = httpDetailError;

///也可以使用下下标的方式获取元组中的值，下标是从 0 开始的
println("\( httpDetailError.0 )");

var str_option = "123";

var test_str_option = str_option.toInt();
if let value = test_str_option {
    println(value);
}

str_option = "one,two,three";

test_str_option = str_option.toInt();
if let value = test_str_option {
    
}

//MARK: - 使用断言
assert(str_option.toInt() == nil, "所处理字符串不能转化为数字");
assert(str_option.toInt() == nil);

//MARK: - swift运算符需要注意的

/**
swift 与C、OC 不一样，自增和自减可以包含浮点数、 求余运算符（%）可以对浮点数进行求余运算
switch 条件方法每条case后不需要break，就会跳出，case包括的值不值之后整数和字符，还可以包含字符串、表达式
*/

var test_float_value = 1.3;

println(++test_float_value);

//MARK: - 新增的数值区间

///区间值只能为整数
///闭区间"..."
for index in 1...5 {
    println(index);
}

//var index_range = 5;
/////半闭区间".."、报错
//for index in 1..index_range {
//    println(index);
//}

var null_string1 = "";
var null_string2 = String();

///判断字符串是否是空
println(null_string1.isEmpty);

///链接字符串
null_string1 += "hello, world";

///使用 Character 遍历字符串
for character in null_string1 {
    println(character);
}

///计算字符串的长度
countElements(null_string1);

///判断字符串前缀是否相等
//null_string1.hasPrefix(<#prefix: String#>)

///判断字符串后缀是否相等
//null_string1.hasSuffix(<#suffix: String#>)

///大写
null_string1.uppercaseString;

///小写
null_string1.lowercaseString;

///访问Unicode
///使用 utf8

for char1 in null_string1.utf8 {
    println(char1);
}

///需要注意的是 NSString中的length 是通过字符串 utf16后计算的长度

///使用 utf16
for char2 in null_string1.utf16 {
    println(char2);
}

///
///您可以通过遍历字符串的 unicodeScalars 属性来访问它的 Unicode 标量表示。其为 UnicodeScalarView 类型的属性, UnicodeScalarView 是 UnicodeScalar 的集合。一个 Unicode Scalar 是任意的 21 位的 Unicode 代码点。///每一个 UnicodeScalar 拥有一个值属性,可以返回对应的21位数值,用 UInt32值来表示。
///1. for scalar in dogString.unicodeScalars {
///2. print("\(scalar.value) ")//3. }//4. print(" \n")//5. // 68 111 103 33 128054
//
//*/

///swift 与 c 中的数组很相似，存储的数据类型单一
///创建一个数组
var shoppingList1: [String] = [];
var shoppingList2: [String] = ["1", "2"];

///计算数组的长度
shoppingList1.count;

///检查数据是否为空
shoppingList2.isEmpty;

///在后面添加数据
shoppingList2.append("3");

///数组中直接加保存的类型会报错
//shoppingList2 += "4";

///也可以使用 += 号
shoppingList2 += ["4"];

shoppingList2[1...3] = ["two", "three", "four"];

println(shoppingList2);

shoppingList2.insert("five", atIndex: shoppingList2.count);

shoppingList2.removeAtIndex(shoppingList2.count - 1);

///除了for in  还可以使用 enumerate 函数来对数组进行遍历
///它返回一个元组，包括数据的索引和数据
///和NSArray 中遍历用的block相似
for (index, value) in enumerate(shoppingList2) {
    println("index: \(index), value: \(value)");
}

///创建并构造一个数组
var someInts = [Int]();


