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
    
    func checkForWinner() -> Int {
        
        // For each combination, this for loop gets the value from gameState and compares the value to the other values of the winning combo. E.g. the first combination is 0, 1, 2. First, it checks the value of gameState[0], then gameState[1], then gameState[2]. The second combo is 3, 4, 5. Then it is gameState[3], gameState[4] and gameState[5] that are compared. Etc.
        
        for combination in winningCombinations {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                
                if gameState[combination[0]] == 1 {
                    return 1
                } else {
                    return 2
                }
            }
        }
        return 0
    }
    
}
