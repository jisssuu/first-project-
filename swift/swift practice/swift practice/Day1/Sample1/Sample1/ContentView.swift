//
//  ContentView.swift
//  Sample1
//
//  Created by 홍길동 on 2022/07/11.
//
/*
 
 // 혼자 실습
import SwiftUI


struct ContentView: View {
    @State var imageNum = 0    // @State는 해당 변수의 값이 변경 되면 view를 다시 랜더링하므로 값이 바뀜에 따라 최신화 된다.
    @State var prevNum = 2     // 따라서 @State를 주지 않고 body 밑에 변수를 선언한 뒤 숫자를 변경해도
    @State var buttenPrev = 1  // 최신화가 되지 않아 이미지가 안바뀌는 현상이 일어났던 것이다.
    @State var nextNum = 0     // 교수님 추가 설명 : body가 바뀌면서 변수들의 값이 다시 초기화되므로 Button을 눌렀을 때 imageNum은 바뀌더라도
    @State var buttenNext = 0  // 화면이 바뀌면서 숫자가 다시 초기화 된다. @State는 변수의 숫자가 바뀔 때 다시 Body를 새로 그리는 것 !!!
    var body: some View {
        let imageArray = ["cat_1" , "cat_2" , "cat_3" , "cat_4" , "cat_5"]
        let prevArray = ["prev","prev_p","prev_d"]      // 초기상태 , 눌렀을 때 , 끝까지 갔을 때
        let nextArray = ["next","next_p","next_d"]      // 초기상태 , 눌렀을 때 , 끝까지 갔을 때
        VStack {
            HStack {
                Button{
                        imageNum -= 1
                        prevNum = 1
                        buttenPrev = 0
                        buttenNext = 0
                        nextNum = 1
                        if imageNum == 0{
                            buttenPrev = 1
                            prevNum = 2
                    }
                }label: {
                    Image(prevArray[prevNum])
                        .resizable()
                        .frame(width: 50, height: 50)
                }.disabled(buttenPrev == 1)
                Spacer()
                Text("\(imageNum + 1) / \(imageArray.count)")
                    .font(.largeTitle)
                    .padding()
                Spacer()
                Button{
                        imageNum += 1
                        nextNum = 1
                        buttenPrev = 0
                        prevNum = 1
                        if imageNum == (imageArray.count - 1) {
                            nextNum = 2
                            buttenNext = 1
                        }
                }label: {
                    Image(nextArray[nextNum])
                        .resizable()
                        .frame(width: 50, height: 50)
                }.disabled(buttenNext == 1)
            }
            Image(imageArray[imageNum])
                .resizable()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
*/

//
//  ContentView.swift
//  Sample1
//
//  Created by 홍길동 on 2022/07/11.
//

// 교수님 version
// 나는 배열을 이용하여 숫자 비교를 통해
import SwiftUI
/*
struct TopButtonModifier : ViewModifier {
    func body(content: Content) -> some View {
        content                 // return 생략
            .frame(width: 60, height: 60)
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.orange)
    }
}
*/

// press는 binding을 이용하여 상태를 구분 !
struct TopButton: View {
    enum Dir { case left, right }
    var enabled: Bool
    var dir: Dir
    var action: () -> Void          // closer를 받아야 하므로 action의 타입은 함수
    var body: some View {
        var imageName: String = dir == .left ? "prev" : "next"
        if !enabled {
            imageName += "_d"
        }
        return Button{
            action()
        }label: {
            Image(imageName)
                .resizable()
                //.modifier(TopButtonModifier())
                .frame(width: 60, height: 60)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(enabled ? Color.orange : Color.gray)
        }.disabled(!enabled)
    }
}

struct ContentView: View {
    @State var pageNumber = 1
    var body: some View {
        VStack {
            HStack {
                TopButton(enabled: pageNumber > 1 , dir: .left) {
                    pageNumber -= 1
                }
                Spacer()
                Text("\(pageNumber) / 5")
                    .font(.largeTitle)
                Spacer()
                TopButton(enabled : pageNumber < 5 , dir: .right) {
                    pageNumber += 1
                }
            }
                Image("cat_\(pageNumber)")
                    .resizable()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}



