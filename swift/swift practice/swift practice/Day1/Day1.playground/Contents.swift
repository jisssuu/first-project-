import UIKit

print("Hello World")

//let a = 10
//a + 30

let str = "World"
print ("Hello, \(str)!")
// \(상수 이름) => string interpolation 스트링 안에다 다른 값을 집어 넣는다.

var a = 10
let b = 20.0
let c = Double(a)+b
print(type(of:a))
print(type(of:b))
print("sum=\(c)")

var d = 20
d += 30
print("d=\(d)")

let arr = ["Hello" , "World"] //arr은 let으로 선언되었으므로, 변경 추가 삭제 불가
let t = type(of:arr)
let s = "type=\(t)"
print(s)
print(arr[0])
print(arr[1])

let dict = ["Kim" : 12 , "Lee" : 32]
print(type(of:dict))      // String to Int Dictionary
print(dict["Lee"] as Any) // dict["Lee"]만 할 시 경고가 뜸.
// Dictionary 는 순서를 중요하게 생각하지 않는다. 빨리 찾는거에 목적인 타입이기 때문이다.

//swift 2.0 이상에서는 ++이 사라짐 따라서, +=을 사용
a += 1 // let이므로 추가 x, fix 누를 시 var로 변경

//a = 1.0 => swift는 type strict 하므로, 정수로 선언 시 정수만 들어감.
// double 값 넣을 시 오류

var name:String = "Hello" // 원래 형태. 이름은 name , type은 String , 값은 "Hello"


let names = ["Kim" , "Lee" , "Park"] // names:[String] [String]이 생략
let kim = names[0] //kim:String
let count = names.count // array의 길이 => count
//names.append("hello") => names는 let이므로 append와 같은 추가 or 변경 or 삭제 불가

// swift는 Java와 다르게 names1[1]의 내용을 바꿔도 다른 곳에는 영향이 가지 않음. copy-on-write 기법
var names1 = names
var names2 = names1
names1[1] = "Jang"

names
names1
names2


let nums = [ 1 , 2 ]    // Int
let arr1 = [ 1 , 1.0 ]  // Double

// let a2:[Any] = [ 1 , "2" ]     Any 형태를 나타내줘야 오류 발생하지 않는다.

// let a2:[CustomStringConvertible] = [ 1 , "2" ]  // a2:[Any] or [ 1 , "2" ] as Any도 가능.

var xx:[String] = []    // 타입 명시를 해주지 않으면 오류 발생. 타입 명시를 해주거나, 배열에 내용을 넣어줘야 함.
xx.append("hello")
xx = []                 // 타입 명시를 해준 다음 다시 비우게 되면 오류가 발생하지 않는다.

// 비어있는 배열/객체를 만드는 방법 두가지.
var emptyArray:[String] = []
var ea2 = [String]()

var ed1:[String:Int] = [:]
var ed2 = [String:Int]()

let arr2 = [1,2,3,4]
arr2[3]
// arr[10] 존재하지 않은 인덱스이므로 error.  확인 방법은 전체 길이보다 작은지 확인하면 된다.

let ages = ["Kim" : 10 , "Lee" : 30]
let age = ages["Kim"]   // 타입은 Int가 아닌 Int?
let a2 = ages["Park"]   // age 와 타입이 같다.(Int?)  swift는 NULL을 nil로 표현된다.
let a3 = age!
// Int? ?는 optional 이라 하며, age나 a2는 ages에서 찾지만, 찾을 수도 있고, 못 찾을 수도 있다.
// optional을 제거하는 것이 !. 따라서 a3의 형태는 Int? 가 아닌 Int 이다.

// Set은 집합이며 , 형태는 Set<Int> , Set<String>와 같이 표현.

let ages1 = [13, 18, 34, 29]
var dollor = 0;
for age in ages1{               // for문이나 if문을 넣었을 때 () 생략 가능! But, {}은 무조건 있어야 함.
    if age > 19 {
        dollor += 20
    }
    else {
        dollor += 15
    }
}
dollor

let ages2 = ["Kelly" : 13 , "Mac" : 18 , "John" : 34 , "Kim" : 29]
var dollar = 0
var names3 = ["Kelly" , "Grace" , "Kim" ]
for name in names3 {
    let age = ages[name]
    if age != nil {              // Optional의 값이 nil이 아닌지 먼저 판단
        if age! > 19 {          // 그 다음 !를 이용하여 unwrap을 한다. 만일 nil에 unwrap을 하는 경우 프로그램이 죽는다.
            dollar += 20
        }
        else {
            dollar += 15
        }
    }
    else {
        dollar += 20
    }
}
/*
if let a = xxxxx {
 do something
}
 
// early return

// guard
guard
*/

/*
Range operator
... 이나 ..< 사용
 10...99 와 10 ..< 100 은 같은 값.    (inclusive)...(inclusive) / (inclusive) ..< (unclusive)
 
 숫자를 표현할 때 , 1_000_000 가능. 알아보기 쉽게 하기 위한 방법. _를 아무곳이나 사용 가능.
 
 */

let ages3 = ["Kelly" : 13 , "Mac" : 18 , "John" : 34 , "Kim" : 29]
for (name , age) in ages3 {
    _ = "\(name) is \(age)"
}


// function

import Foundation
func greet(name: String, day: String) -> String {   // 타입은 String 2개를 받아서 String 1개를 반환하는 함수
    return "Hello \(name) , today is \(day)"
}
func hello(a:String, b: String) -> String{          // 타입은 String 2개를 받아서 String 1개를 반환하는 함수
    return a+b
}

var fff = greet     // greet 타입이 fff에 대입된다.  타입은 String 2개를 받아서 String 1개를 반환하는 함수

let mm = fff("Kim" , "Sunday")
    
fff = hello         // hello 와 greet는 타입이 같기에 fff에 대입이 가능하다.

let m2 = fff("Kim" , "Sunday")

// 타입은 String 2개를 받아서 String 1개를 반환하는 함수 => (String , String ) -> String

let msg1 = greet(name: "Tukorea", day: "Monday")

let msg2 = greet (name : "x" , day: "good")

let t1 = (10 , 20)          // Int Int tuple            t1.0 t1.1 같은 형태로 쓰이긴 하지만
let t2 = (x:10 , y:20)      // x:Int y:Int tuple        대부분 t2.x t2.y 같은 형태로 쓰임.


func sum_mul(a: Int, b: Int) -> (Int , Int){
    return (a+b, a*b)
}
let x = sum_mul(a: 10, b: 20)
let y = sum_mul(a: 100, b: 102)


