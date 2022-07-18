//
//  GameModel.swift
//  MemoryGame
//
//  Created by 홍길동 on 2022/07/14.
//

import Foundation
import SwiftUI

struct Card {
    enum State {
        case removed , closed , open
    }
    var state: State
    let number: Int
}
class GameModel : ObservableObject {        // 지켜볼 수 있다.
    static let rows = 5
    static let cols = 4 // 클래스 변수
    
    @Published var cards = [Card]()    // var cards:[Card] = []    둘 다 같은 의미 cards라는 변수는 [Card] 타입을 가지며 내용은 비어있다.
                                        // Published는 변경되었을 때 뷰를 다시 그리라고 할 수 있는 것
    @Published var flips = 0
    var openCardIndex: Int?
    private var count = 0
    var over: Bool {
        count == 0
    }
     func start() {                      // fileprivate : 다른 파일에서는 이 함수에 접근을 하지 못함. 같은 파일 내에서만 부를 수 있다.
        flips = 0
        cards = []
        let max = GameModel.rows * GameModel.cols / 2
        for i in 1...max {
            cards.append(Card(state: .closed, number: i))
            cards.append(Card(state: .closed, number: i))
        }
         count = cards.count
         
         cards.shuffle()
    }
    
    init() {
        start()
    }
    func card(row: Int , col : Int) -> Card {
        cards[row * GameModel.cols + col]
    }
    func open(row: Int, col: Int) {
        let index = row * GameModel.cols + col
        if index == openCardIndex {
            return
        }
        if cards[index].state == .removed {
            return
        }
        if let oci = openCardIndex {
            let num = cards[oci].number
            if num == cards[index].number {
                cards[index].state = .removed
                cards[oci].state = .removed
                openCardIndex = nil
                count -= 2
            } else {
                cards[oci].state = .closed
                cards[index].state = .open
                openCardIndex = index
                flips += 1
            }
        } else {
            cards[index].state = .open
            openCardIndex = index
            flips += 1
        }
        
//        if openCardIndex == nil {
//            cards[index].state = .open
//        } else {
//            let num = cards[openCardIndex!].number
//            if num == cards[index].number {
//                cards[index].state = .removed
//                cards[openCardIndex!].state = .removed
//                openCardIndex = nil
//            } else {
//                cards[openCardIndex!].state = .closed
//                cards[index].state = .open
//                openCardIndex = index
//            }
//        }
        
//        if cards[index].state == .open {
//            cards[index].state = .closed
//        }
//        else if cards[index].state == .closed {
//            cards[index].state = .open
//        }
//        openCardIndex = index
    }
}
