//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by 홍길동 on 2022/07/13.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    var body: some Scene {
        WindowGroup {
            MenuView()
            //GameView(prefix: "t")
            //CardView(state: .open, prefix: "f", num: 1)
        }
    }
}
