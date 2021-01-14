//
//  Game.swift
//  TicTacToe
//
//  Created by Emelie on 2021-01-14.
//

import Foundation
import UIKit

class Game {
    
    var gameState: [Int]
    var winningCombinations: [[Int]]
    var gameIsActive: Bool
    
    init() {
        // Keeps track of empty boxes
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        // All winning combinations
        winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        
        // Keeps track of if the game is active
        gameIsActive = true
    }
    
    func resetGameState() -> [Int] {
        return [0, 0, 0, 0, 0, 0, 0, 0, 0]
    }
}
