//
//  ViewController.swift
//  TicTacToe
//
//  Created by Emelie on 2020-12-15.
//

import UIKit

class ViewController: UIViewController {
    
    // Keeps track of active player, 1 or 2
    var activePlayer = 1
    
    // Keeps track of empty boxes. 0 = empty box
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    // Winning combinations, three in a row
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    // Variable to check if the game is active
    var gameIsActive = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 9 image views connected to function action
    @IBAction func action(_ sender: UIButton) {
        
        // Checks if the box is empty
        if gameState[sender.tag - 1] == 0 && gameIsActive == true {
            
            //Changes state of the box from 0 to number of active player
            gameState[sender.tag - 1] = activePlayer
            
            //Sets the player's image in the chosen box
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "cross"), for: UIControl.State())
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "circle"), for: UIControl.State())
                activePlayer = 1
            }
        }
        
        // For each combination, this for loop gets the value from gameState and compares the value to the other values of the winning combo. E.g. the first combination is 0, 1, 2. First, it checks the value of gameState[0], then gameState[1], then gameState[2]. The second combo is 3, 4, 5. Then it is gameState[3], gameState[4] and gameState[5] that are compared. Etc.
        for combination in winningCombinations {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                
                gameIsActive = false
                
                if gameState[combination[0]] == 1 {
                    // Cross won, player 1
                    print("Player 1 won")
                } else {
                    // Circle won, player 2
                    print("Player 2 won")
                }
            }
        }
    }
}

