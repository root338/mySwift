//: Playground - noun: a place where people can play

import UIKit

//MARK - 数组字典的声明
///声明一个数组
var test_array_001 = [String]();
///声明一个字典
var test_dictionary_001 = [String : String]();

test_dictionary_001.updateValue("12", forKey: "12");
test_dictionary_001["13"] = "13";
test_dictionary_001.description;
test_dictionary_001.endIndex;

for (key, value) in test_dictionary_001 {
    
}

//当类型确定后数组和字典可以向下面这样
test_array_001 = [];
test_dictionary_001 = [:];

//MARK - 区间
//区间
//半开半闭区间
for test_autoCount_i_001 in 0..<10 {
    println("\(test_autoCount_i_001)");
}

//闭区间
for test_autoCount_i_001 in 0...10 {
    println("\(test_autoCount_i_001)");
}



var test_string_001 : String?

test_string_001 = "1";

if let name = test_string_001 {
    println(name);
}

//MARK - 函数

///拼接两个字符串
func spliceTwoString(func_str_001 : String, func_str_002 : String) -> String
{
    return func_str_001.stringByAppendingString(func_str_002);
}

spliceTwoString("hello ", "world");

///返回多个值
//func dicionaryToKeyAndValue(func_dictionary_001 : [String: String]) -> (keys: [String], values: [String]) {
//    return (func_dictionary_001.keys, func_dictionary_001.values);
//}
test_array_001.append("12");
test_array_001.append("13");

//使用闭包的类型

//1
let test_array_map_number_001 = test_array_001.map { (func_string_001 : String) -> Int in
    var func_int_002 = func_string_001.toInt();
    var func_int_003 : Int = 0;
    if (func_int_002 != nil) {
        
        func_int_003 = func_int_002!;
    }
    return func_int_003;
};

//类型2
let test_array_map_number_002 = test_array_001.map{func_string_001 in func_string_001 };

for auto_addCount_001 in 0...5 {
    let test_value_001 = arc4random() % 100;
    test_array_001.append("\(test_value_001)")
}

println(test_array_001);
//类型3
let test_array_sort_001 = sorted(test_array_001){$0 > $1};

println("\(test_array_map_number_001)");
println(test_array_map_number_002);
println(test_array_sort_001);

class test_class_001 {
    
    var test_class_value = 0
    var test_class_string_001: String
    
    
    let test_class_let_value = 0;
    
    //初始化
    init(test_class_string_001: String) {
        self.test_class_string_001 = test_class_string_001
    }
    
    //析构
    deinit {
        
        self.test_class_value = 0;
    }
    
    func test_func_addTwoValue(func_int_001: Int, func_int_002: Int) ->Int {
        return func_int_001 + func_int_002;
    }
    
}

//类继承
class test_class_001_subclass_001 : test_class_001 {
    
    override func test_func_addTwoValue(func_int_001: Int, func_int_002: Int) -> Int {
        var class_func_value_int_001 = super.test_func_addTwoValue(func_int_001, func_int_002: func_int_002);
        return class_func_value_int_001 * 10
    }
}

var test_class_object_001 = test_class_001(test_class_string_001: "hello, custom class");
test_class_object_001.test_class_value = 10;
test_class_object_001.test_func_addTwoValue(5, func_int_002: 10);

var test_class_object_002 = test_class_001_subclass_001(test_class_string_001: "hello, sub class");
test_class_object_002.test_func_addTwoValue(10, func_int_002: 2);


