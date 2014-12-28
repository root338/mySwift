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