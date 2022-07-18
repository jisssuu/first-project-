//
//  ContentView.swift
//  MoreControls
//
//  Created by 홍길동 on 2022/07/12.
//

import SwiftUI

struct ContentView: View {
    @State var count = 0
    @State var name = ""
    @State var angle = 0.0
    var body: some View {
        VStack {
            Text("Name: \(name) Count: \(count)")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.green)
                .padding()
                .rotationEffect(Angle.degrees(angle))   // degrees of radians 사용 우리는 0...360 했으므로 degrees
                .animation(.easeIn(duration: 0.5), value: angle)    // animation을 이용하여 좀 더 깔끔하게 회전
            Text("Angle: \(angle)")
            Image(systemName: "pencil.tip.crop.circle.badge.arrow.forward")
                .font(.largeTitle)
            Button {
                count += 1
            } label: {
                Image(systemName: "goforward.plus")
                    .font(.largeTitle)
            }
            TextField("Enter your name here", text: $name)  // Binding!
                .frame(width: 200)
            Slider(value: $angle, in: 0 ... 360 )   // Binding은 $ 표시를 한다.   in은 range 설정 ... or ..<
                .frame(width: 200)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
