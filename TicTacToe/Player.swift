//
//  Player.swift
//  TicTacToe
//
//  Created by Emelie on 2021-01-10.
//

import Foundation

class Player {
    var name: String
    var wins: Int = 0
    
    init(name: String, wins: Int) {
        self.name = name
        self.wins = wins
    }
    
    func addOneWin() {
        wins += 1
    }
}
