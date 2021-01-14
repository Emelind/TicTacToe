//
//  Game.swift
//  TicTacToe
//
//  Created by Emelie on 2021-01-14.
//

import Foundation

class Game {
    
    var gameState: [Int]
    var winningCombinations: [[Int]]
    var gameIsActive: Bool
    var activePlayer: Int
    
    init() {
        // Keeps track of empty boxes
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        // All winning combinations
        winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        
        // Keeps track of if the game is active
        gameIsActive = true
        
        // Keeps track of active player
        activePlayer = 1
    }
    
    // Resets gameState, gameIsActive and activePlayer
    func resetGame() {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
    }
    
    // Changes between the two players
    func changePlayer() {
        if activePlayer == 1 {
            activePlayer = 2
        } else {
            activePlayer = 1
        }
    }
}
