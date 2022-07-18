import Foundation

enum Rank: Int {        // RawType  Int로부터 상속받는다는 느낌? 내부적으로 Int를 갖는다? Int 뿐만 아니라 Double, Float 모두 가능
    case ace = 1, two, three, four, five       // 기본으로 세팅 시  ace의 rawValue는 0이 된다. 따라서 ace를 1로 잡아주면 1부터 올라간다,.
    case six, seven, eight, nine, ten
    case jack, queen, king
    
    func desc() -> String {
        switch self {       // self의 타입은 Rank !
        case .ace:
            return "Ace"
        case .jack:
            return "Jack"
        case .queen:
            return "Queen"
        case .king:
            return "King"
        default:
            return "\(self.rawValue)"
        }
    }
}
var r = Rank.nine
r.rawValue          // Rank:Int로 설정해서 숫자를 넣을 수 있다.
// r = .seven      // Rank.seven 써도 된다.  자동으로 r의 타입이 Rank인 것을 알고 있다.
r.desc()        // enum 내부의 함수 불러올 수 있다. r의 타입이 Rank 이므로 !

func printRank(rack: Rank){
    print("I don't know")
}
printRank(rack: r)
printRank(rack: .king) // Rank.king을 넣어도 되지만, 이미 자동으로 Rank 타입인 것을 알고 있기에 생략이 가능하다.

// value Association
enum Response {
    case result(String, String)
    case error(String)
}

let res1 = Response.error("Not ready")
let res2 = Response.result("Kim","Seoul")

func desc(sr : Response) -> String {
    switch (sr) {
    case let .result(name, city):
        return "Name: \(name) City: \(city)"
    case let .error(cause):
        return "Error: \(cause)"
    }
}
desc(sr: res1)
desc(sr: res2)

// Value Type 과 Reference Type
// Value Type 은 복사 하고 한 값을 바꿔도 다른 값은 바뀌지 않는다.   a = 10 b = a b = 20 => a=10 b=20
// Reference Type은 복사 하고 한 값을 바꾸면 다른 값도 같이 바뀐다.  a = 10 b = a b = 20 => a=20 b=20
// 따라서 Class 보다 Struct를 많이 사용한다.

// Property Wrapper
/*
struct Address {
    private var _city: String = ""
    var city : String{
        get{_city}
        set(v) {_city = v.uppercased()}     // uppercased() 는 모든 String 대문자로 !
    }
    var name : String
    var country : String
}
*/
@propertyWrapper    // 위 코드의 city 부분을 모든 것에 해주고 싶을 때 이 코드를 사용한다.
struct FixCase {
    private(set) var value : String = ""
    var wrappedValue : String {
        get{value}
        set{value = newValue.uppercased()}
    }
    init(wrappedValue initialValue: String) {
        self.wrappedValue = initialValue
    }
}
// @FixCase를 사용하여 city, name, country에 모두 적용한다.
struct Address {
   @FixCase var city : String
   @FixCase var name : String
   @FixCase var country : String
}
var seoul = Address(city: "Seoul" , name:"Kim", country:"Korea")
seoul.city      // SEOUL
seoul.name      // KIM
seoul.country   // KOREA
