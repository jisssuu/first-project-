//
//  ContentView.swift
//  GestureSample
//
//  Created by 홍길동 on 2022/07/13.
//

// Gesture 가장 기본 3가지 : Press, Move, Release
// LongPress -> Duration
// Tap(Click) = Touch on Inside
// Double Tap, Triple Tab,...
// Drag , Pan -> Translation
// Flick (Fling) - Decelerating(속도 감소)  => 적은 터치로 빠르게 하고싶을 때
// Swipe -> Direction  / 여기까지가 1 finger
// Pinch -> scale
// Rotation -> Angle


import SwiftUI

struct ContentView: View {
    @State var spinning = false
    @State var visible = true
    @State var count = 0
    @GestureState var angle:Angle = Angle.zero
    var body: some View {
        let tap = TapGesture()
            .onEnded{
                count += 1
            }
//        let longPress = LongPressGesture()
//            .onEnded{ _ in
//                count += 10
//            }
        let rot = RotationGesture() // changed를 사용하는 것이 빈번
            .updating($angle){
                angle, state, transaction in
                state = angle
            }
            /*.onChanged { angle in
                print("Angle: \(angle)")
                self.angle = angle
            }
            .onEnded{ _ in print("Rotation Ended")}
             */
        VStack {
            Text("count = \(count) , angle = \(angle.degrees)")
            ZStack {
                Circle()
                    .stroke(.blue, lineWidth: 5)
                    //.background(Circle().fill(.yellow)) 한가지로만 fill하는 방법
                    .background(Circle().fill(
                        RadialGradient(gradient: Gradient(colors:[  // gradation 방법
                            Color.red , Color.yellow , Color.green ,Color.blue ,Color.black
                        ]), center: .center, startRadius: 0, endRadius: 50)
                    ))
                    .frame(width: 100, height: 100)
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.green, lineWidth: 10)
                    .frame(width: 150, height: 150)
                Text("Tap Me !!")
                    .padding(100)
                    .gesture(tap)
                    .border(Color.red, width: 4)
                .rotationEffect(angle)
            }
            .rotationEffect(.degrees(spinning ? 360 : 0))
            .animation(
                .linear(duration: 1)
                    .repeatForever(autoreverses: false),
                value: spinning ? 360 : 0
                    
            )
            .onAppear {
                spinning = true
            }
            Toggle(isOn: $visible.animation(.linear)) {
                Text("Toggle Controller")
            }.frame(width: 200)
            Button{
//                spinning = !spinning
            } label:{
            Text("Toggle Spinning")
                .padding(10)
                .background(
                    Capsule()
                        .stroke(.gray,lineWidth: 5)
                )
            }
            if visible {
                Path { path in      // 직접 좌표를 찍어 그림을 그리는 방법
                    path.move(to: CGPoint(x: 200, y: 100))
                    path.addLine(to: CGPoint(x: 100, y: 300))
                    path.addLine(to: CGPoint(x: 300, y: 300))
                    //path.addArc(tangent1End: CGPoint(x: 100, y: 100), tangent2End: CGPoint(x: 300, y: 300), radius: 5)
                    path.closeSubpath()
                }.stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .miter))
            }
            HStack {
                Image(systemName: "pencil.and.outline")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("Rotate Me")
                    }
                .padding(50)
                .background(LinearGradient(
                    colors: [Color.white, Color.yellow , Color.brown , Color.purple],
                    startPoint: .topLeading  , endPoint: .bottomTrailing)
                )
        }.gesture(rot)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
