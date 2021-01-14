//
//  ViewController.swift
//  TicTacToe
//
//  Created by Emelie on 2020-12-15.
//

import UIKit

class ViewController: UIViewController {
    
    // TEST FOR HIGHSCORE
    var players = Players()
    
    // Create object of class Game
    var game = Game()
    
    // Store names of players (from StartGameViewController)
    var playerOne: String?
    var playerTwo: String?
    
    // Outlet for Players Turn Label
    @IBOutlet weak var playersTurnLabel: UILabel!
    
    //Outlets for players names
    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel!
    
    //Outlets for players scores
    @IBOutlet weak var playerOneScoreLabel: UILabel!
    @IBOutlet weak var playerTwoScoreLabel: UILabel!
    
    // Variables for players scores
    var playerOneScore = 0
    var playerTwoScore = 0
    
    @IBOutlet weak var playerWonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Displays playerOnes name
        playersTurnLabel.text = playerOne! + ", it is your turn!"
        
        // Displays players names and scores
        playerOneLabel.text = playerOne!
        playerTwoLabel.text = playerTwo!
        playerOneScoreLabel.text = String(playerOneScore)
        playerTwoScoreLabel.text = String(playerTwoScore)
        
    }
    
    // 9 buttons connected to function action
    @IBAction func action(_ sender: UIButton) {
        
        // Checks if the box is empty
        if game.gameState[sender.tag - 1] == 0 && game.gameIsActive == true {
            
            //Changes state of the box from 0 to number of active player
            game.gameState[sender.tag - 1] = game.activePlayer
            
            //Sets the player's image in the chosen box
            if game.activePlayer == 1 {
                sender.setImage(UIImage(named: "cross"), for: UIControl.State())
                
                //Changes the activePlayer to playerTwo, and displays the name
                game.changePlayer()
                playersTurnLabel.text = playerTwo! + ", it is your turn!"
            
            } else {
                sender.setImage(UIImage(named: "circle"), for: UIControl.State())
                
                //Changes the activePlayer to playerOne, and displays the name
                game.changePlayer()
                playersTurnLabel.text = playerOne! + ", it is your turn!"
            }
        }
        
        // For each combination, this for loop gets the value from gameState and compares the value to the other values of the winning combo. E.g. the first combination is 0, 1, 2. First, it checks the value of gameState[0], then gameState[1], then gameState[2]. The second combo is 3, 4, 5. Then it is gameState[3], gameState[4] and gameState[5] that are compared. Etc.
        for combination in game.winningCombinations {
            if game.gameState[combination[0]] != 0 && game.gameState[combination[0]] == game.gameState[combination[1]] && game.gameState[combination[1]] == game.gameState[combination[2]] {
                
                // Someone has won the game and the game is not active
                game.gameIsActive = false
                
                // playersTurnLabel is hidden
                playersTurnLabel.isHidden = true
                
                // If the value in gameState is 1, player 1 won. Else, player 2 won
                if game.gameState[combination[0]] == 1 {
                    // Cross won, player 1
                    playerWonLabel.text = playerOne! + " won"
                    
                    // Adds one to score
                    playerOneScore += 1
                    playerOneScoreLabel.text = String(playerOneScore)
                    
                    /*
                    // Test for high score
                    var a = 0
                    
                    for player in players.list {
                        a += 1
                        if playerOne == player.name {
                            player.addOneWin()
                            print("\(player.name) + \(player.wins)")
                            break
                        }
                        if a == players.list.count && playerOne != player.name {
                            players.add(player: Player(name: playerOne!, wins: 1))
                            print(players.list.count)
                        }
                    }*/
                    
                } else {
                    // Circle won, player 2
                    playerWonLabel.text = playerTwo! + " won"
                    
                    // Adds one to score
                    playerTwoScore += 1
                    playerTwoScoreLabel.text = String(playerTwoScore)
                    
                    /*
                    // Test for high score
                    var b = 0
                    
                    for player in players.list {
                        b += 1
                        if playerTwo == player.name {
                            player.addOneWin()
                            print("\(player.name) + \(player.wins)")
                            break
                        }
                        if b == players.list.count && playerTwo != player.name {
                            players.add(player: Player(name: playerTwo!, wins: 1))
                            print(players.list.count)
                        }
                    }*/
                }
                
                // When someone has won the game, one can see who has won and choose to play again
                playAgainButton.isHidden = false
                playerWonLabel.isHidden = false
            }
        }
        
        // The game is set to not active
        game.gameIsActive = false
        
        // If there is still an empty box, the game is still active
        for i in game.gameState {
            if i == 0 {
                game.gameIsActive = true
                break
            }
        }
        
        // If the game is not active, and noone has won, it means that is is tie and one can choose to play the game again.
        if game.gameIsActive == false {
            playerWonLabel.text = "It was a draw.."
            playerWonLabel.isHidden = false
            playAgainButton.isHidden = false
            playersTurnLabel.isHidden = true
        }
    }
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    // Function for the playAgainButton
    @IBAction func playAgain(_ sender: UIButton) {
        
        // gameState is changed to initial zeros only
        game.gameState = game.resetGameState()
        
        // Game is active again
        game.gameIsActive = true
        
        // The activePlayer is set to player 1
        game.activePlayer = 1
        
        playersTurnLabel.isHidden = false
        playersTurnLabel.text = playerOne! + ", it is your turn!"
        
        // And the playAgainButton is not visible
        playAgainButton.isHidden = true
        playerWonLabel.isHidden = true
        
        // The images are removed from the image views to clear the board
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
}

