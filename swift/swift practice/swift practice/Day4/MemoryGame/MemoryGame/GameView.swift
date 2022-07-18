//
//  ContentView.swift
//  MemoryGame
//
//  Created by 홍길동 on 2022/07/13.
//

import SwiftUI

struct GameView: View {
    var prefix: String
    @ObservedObject var game = GameModel()      // 지켜보겠다.   ObservedObject ObservableObject Published  는 세트로 다닌다.
    @Environment(\.presentationMode) var present
    @State var showsRestartAlert = false
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Memory Game")
                    .font(.largeTitle)
                Spacer()
                Text("Flips: \(game.flips)")
                    .font(.headline)
            }.padding(.horizontal)
            Spacer()
            GridStack(rows: GameModel.rows, columns: GameModel.cols) { row, column in
                return CardView(prefix: prefix,card: game.card(row: row, col: column))
                    .gesture (
                        TapGesture().onEnded {
                            game.open(row: row, col: column)
                            if game.over {
                               showsRestartAlert = true
                            }
                        }
                    )
            }.aspectRatio(CGSize(width: GameModel.cols, height: GameModel.rows), contentMode: .fit)
            Spacer()
            HStack {
                Spacer()
                Button {
                    present.wrappedValue.dismiss()
                } label: {
                    Text("Back")
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .background (
                            Capsule()
                                .stroke(lineWidth: 2.0)
                        )
                }
                Spacer()
                Button {
                    game.start()
                } label: {
                    Text("Restart")
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .background (
                            Capsule()
                                .stroke(lineWidth: 2.0)
                        )
                }

                Spacer()
            }
        }.background (
            LinearGradient(colors: [.white , .blue.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
            
        )   .alert(isPresented: $showsRestartAlert) {
            Alert (
                title: Text("Restart?"), message: Text(" Do you want to restart the game?"), primaryButton: .default(Text("Restart")) {
                    game.start()
                } , secondaryButton: .cancel() {
                    present.wrappedValue.dismiss()
                }
            )
        }
            .navigationBarHidden(true)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
            GameView(prefix: "f")
    }
}
