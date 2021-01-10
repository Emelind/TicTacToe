//
//  Player.swift
//  TicTacToe
//
//  Created by Emelie on 2021-01-10.
//

import Foundation

struct Player {
    var name: String
    var wins: Int
    
    init(name: String, wins: Int) {
        self.name = name
        self.wins = wins
    }
}
