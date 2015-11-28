//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var emptyArray = [String]();
var emptyDictionary = [String : Float]();

//MARK - 当数组或字典的类型确定时可以向下面那样赋值
emptyArray = [];
emptyDictionary = [:];

var i = 0
//0 ... 10 闭区间表示
for i in 0 ... 10 {
    //TODO if 语句必须中必须是bool类型的数值
    if i < 2 {
        print("i 符合 if 条件判断语句");
    }
    switch i {
    case 2 :
        print("case 在 2 分段")
    case let j where j % 2 == 0 :
        print(i)
    default :
        print("switch 其他情况")
    }
}

i = 0

// 0 ..< 10 半开半闭区间
for i in 0 ..< 10 {
    print(i)
}

var optionalString : String? = "hello"
optionalString = nil;

if let name = optionalString {
    print(name)
}

let interestingNumbers = [
    "prime"     : [2, 3, 5, 7, 11, 13],
    "Fibonacci" : [1, 1, 2, 3, 5, 8],
    "square"    : [1, 4, 9, 16, 25]
]

var largest = 0;

for (kind, numbers) in interestingNumbers {
    for number in numbers {
        largest = max(largest, number)
    }
}

largest

func greet(name: String, day: String) ->String {
    return "hello \(name), today is \(day)."
}

greet("Bob", "Tuesday")

func calculateStatistics(scores: [Int]) -> (minValue:Int, maxValue:Int, sumValue:Int) {
    if scores.count > 0 {
        var minValue = scores[0]
        var maxValue = scores[0]
        var sumValue = 0;
        for score in scores {
            minValue =  min(minValue, score)
            maxValue = max(maxValue, score)
            sumValue += score
        }
        return(minValue, maxValue, sumValue)
    }
    return(0,0,0)
}

func makeIncrementer() -> (Int ->Int) {
    
    func addOne(number:Int) ->Int {
        return 1 + number;
    }
    
    return addOne
}

var increment = makeIncrementer()
increment(2)

var numbers = [1,2,3,4,5,6]
numbers.map ({ (number:Int) -> Int in
    let result = 3 * number
    return result
})