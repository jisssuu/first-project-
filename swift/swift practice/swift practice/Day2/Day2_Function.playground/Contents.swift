import UIKit
import os
import Foundation

func points(num:Int, bonus:(Int)->Bool) -> Int {
    var pt = num * 10
    if bonus(num) {
        pt += 1
    }
    return pt
}
points(num: 5, bonus:{ (num: Int) -> Bool in        //closer   중요 !
    return (num % 2) != 0
})

let neg = {(num: Int) -> Bool in    //인자를 Int로 받고 Bool을 리턴
    return num < 0
}
points(num: -2, bonus: neg)

let pos = { $0 > 0 }                // 달러($)표시를 붙이고 0을 넣으면 첫번째 인자가 된다. $1은                                    두번째 인자
points(num: 10, bonus: pos)         // 따라서 $0 은 10이 된다. 또한 한줄은 리턴을 넣지 않아도 된다.
pos(1)                              // pos의 {} 내부 식에 만족하므로 true
pos(-1)                             // 만족하지 못하므로 false

let a = points(num: 9, bonus: {$0 % 3 == 0})
a
let b = points(num: 9) {$0 % 3 == 0}    // 마지막 인자가 closer일 때 괄호를 미리 닫아도 된다.
b
// 인자가 하나 있는데 그 하나가 클로저 일 경우에는 some 의 소괄호() 도 생략 가능하다.
/*some {
    
}
// declarative syntax    선언형 프로그래밍
VStack{}    // VStack은 인자를 클로저로 받는다. Swift의 기본
*/
func odd (num:Int) -> Bool {
    return (num % 2) != 0
}
func negative(num:Int) -> Bool {
    return num < 0
}
points(num: 5, bonus: odd)
points(num: 6, bonus: odd)
points(num: 7, bonus: negative)
points(num: -1, bonus: negative)

// 함수가 함수를 리턴
func incrementor(num:Int) -> (() -> Int) {  // Int를 인자로 받고 인자를 받지 않고 Int를                                                리턴하는 함수를 리턴하는 함수.
    var value = 0
    func increase() -> Int{     // 값을 캡쳐한다. (값을 보존하고 있다는 것)
        value += num
        return value
    }
    return increase
}
let inc3 = incrementor(num:3)
inc3()      // 3을 받는데 , 3을 버리지 않고 가지고 있는다.
inc3()      // 따라서 3을 가지고 있다가 한번 더 호출되면 3 + 3 으로 6이 된다.

let inc7 = incrementor(num:7)
inc7()
inc7()


var numbers = [1, 12, 32, 2, 4, 43, 3]
numbers.sort{(n1:Int, n2:Int) -> Bool in
    return n1 < n2
}
numbers.sort(by: {n1,n2 in
    n1 > n2
})

numbers.sort(by: {$0 < $1})

numbers.sort(by:>)      // swift의 모든 연산자들은 closer로 ! 따라서 > 만 사용 가능



numbers.sort {          //74번의 형식과 동일  -> 생략이 가능하다!
    $0 < $1
}

numbers.sort()

