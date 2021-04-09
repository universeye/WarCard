//
//  gameLogic.swift
//  WarCard
//
//  Created by Terry Kuo on 2021/4/9.
//

import Foundation

class GameLogic: ObservableObject {
    
    @Published var playerNumber: Int = 0
    @Published var botNumber: Int = 0
    
    func compare(player: Int, bot: Int) {
        if player > bot {
            print("you win")
            playerNumber += 1
        } else if player < bot {
            botNumber += 1
            print("bot win")
        } else {
            print("draw")
        }
    }
}
