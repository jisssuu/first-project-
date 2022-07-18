import UIKit

// member variable = field = property = attribute = data
// member function = method = behavior = operation

class Animal {      // 명시해야 하므로 생성자를 만들어줘야함.
    
    var legCount: Int = 0   // 생성자를 주던지, 이처럼 초기값을 주면 된다.
    var name : String
    init(name: String){         // 생성자는 init(){} init은                                  function이 아니다.
        self.name = name    //name이 없는 Animal은 없다.  무조건 입력해야 한다.
    }
    // encapsulation 되어있다!
    func desc() -> String { //Animal 객체에 들어와있는 Member만 사용 가능
        return "An animal named \(name) with \(legCount) legs"
    }
}
class Mammal: Animal {       //class 이름은 Mammal이며 Animal을 상속
    override init(name: String){    // override 기존의 Animal이 하는 것을 바꾼다는 의미
        super.init(name: name)      // 실수가 아니다 라는 의미를 주는 것
        legCount = 4                // 이 부분은 상속받지 않고 내가 정의한다는 의미
    }
    func giveBirth() -> Mammal {
        Mammal(name: "Baby \(name)")    // return은 한 문장이므로 생략 가능
    }
}
let m = Mammal(name: "Elephant")    // Mammal은 Animal을 상속받으므로 이름을 꼭 명시해야 한다!
m.desc()
let child = m.giveBirth()
child.desc()

class Dog : Mammal{                 // Animal을 상속받는 Mammal을 상속받는다.
    func bark() -> String {
        "bark!!"
    }
    override func giveBirth() -> Mammal {
        return Dog(name: "puppy \(name)")
    }
}

class Platypus: Mammal{             // 오리너구리는 포유류지만 알을 낳는다. 포유류중 혼자만 다른 모습. 객체 지향의 표본이 되었다.
    override func giveBirth() -> Mammal {
        print("Laying an Egg")
        return Platypus(name:"Baby \(name) from an Egg")
    }
}

class Monster : Mammal {                        // 다리 개수에 비례하여 무릎 개수를 넣기 위한 방법
    var eyeCount = 0  {                     // 메모리 공간을 차지하게 된다.
        didSet {                            // 옵저버
            legCount = eyeCount * 2
        }
    }
    
    var kneeCount: Int{
        legCount                            // return 생략 가능 !    get도 생략 가능하다.
    }
     /*   get{                                    // get을 이용하여 값을 읽는 것
            return legCount
        }
    }*/
    var toeCount: Int{
        get{
            return 4 * legCount
        }
        set(v) {
            legCount = v / 4
        }
    }
}
let mo = Monster(name: "kakaka")
mo.legCount = 40                        // 메모리 공간을 차지하지 않는다 !
mo.eyeCount
mo.eyeCount = 100                       // eyeCount가 100으로 설정 됨에 따라 legCount 값도 200으로 바뀌게 되어 kneeCount가 200이 된다.
mo.kneeCount                            // kneeCount에 값을 넣어주면 오류가 발생. only get class 이므로 !
mo.toeCount                                 // 코드가 호출 되는 것이다.
mo.toeCount = 96                        // set에 의해 legCount 는 24가 된다.
mo.kneeCount                            // legCount 가 24이므로 kneeCount도 24
mo.toeCount

let animals = [                 // animals의 기본 타입은 Mammal이다. 바꾸려면 animals:[Animal]   바꿔도 문제는 없다.
    Mammal(name: "Elephant"),
    Dog(name: " Jindol"),
    Platypus(name: "Pla")
]

for a in animals{               // a의 타입은 Mammal 이다.
    print(a.desc())
    print(a.giveBirth().desc())
    /*if a is Platypus{               //말 그대로 is - a 관계 이것을 판단하는 것을 is 를 사용한다.
        ///
    } else if a is Dog {///}          // 이렇게 구분할 수 있지만 이렇게 권장하지는 않는다.
    else {///}                        // 쉽게 이야기하면 똑같은 명령을 내리는 것이다. 각각 다른 명령을 넣는게 아닌 같은 명령을 내리지만 출력되는 값은 달라진다!!!!
    */                                // 이를 Polymorphism 이라 부른다.
}
/*
 for a in animals 출력본
 An animal named Elephant with 4 legs
 An animal named Baby Elephant with 4 legs
 An animal named  Jindol with 4 legs
 An animal named puppy  Jindol with 4 legs
 An animal named Pla with 4 legs
 Laying an Egg
 An animal named Baby Pla from an Egg with 4 legs

*/
let n = Dog(name: "maltiz")
n.desc()
n.bark()
let jj = n.giveBirth() as! Dog   // as! -> 컴파일러는 아니라고 생각하지만 우리는 맞다고 생각할 때 as? -> 결과를 잘 몰라서 optional로 알려달라 할때
                                 // as  -> 우리도 알고 컴파일러도 알때
jj                        //따라서 jj의 타입은 Dog가 된다. 만약 우리가 맞다고 생각하여 !를 붙였지만 틀리면 프로그램은 죽게 된다.
jj.bark()                 // jj의 타입을 우리는 Dog이라고 알고 있지만, 컴파일러는 Mammal이라고 생각. 따라서 우리가 신호를 줘야 한다.
jj.desc()                 // jj는 Dog의 giveBirth()를 받아온다. Dog에서 override했기 때문

let kk = n.giveBirth() as? Dog  // 타입은 Dog?가 된다 .
if kk != nil{           // nil이 아닐 때만
    kk!.desc()
    kk!.bark()
}
kk?.desc()      //kk가 nil이 아니면 출력한다는 의미.
kk?.bark()

let e = Mammal(name: "lion")
e.desc()
let ee = e as? Dog          // as! 하게 되면 프로그램 죽게 된다.
let nd = ee?.desc()         // 원래 desc()의 타입은 String 하지만 ee는 nil 이거나 String 이므로 nd의 타입은 String?이 된다.

// Function 에서 inc3 와 inc7 같은 개념!
let a = Animal(name:"Fox")  //init에 의해 name을 꼭 명시!
a.legCount
a.desc()
let b = Animal(name:"chicken")
b.legCount = 10
b.desc()

