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
    
    var cpuPossibilities: [Int] = []
    
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
                
                // Changes the player to player two
                game.changePlayer()
                
                
                // Checks for winner
                let winner = game.checkForWinner()
                if winner != 0 {
                    
                    game.gameIsActive = false
                    playersTurnLabel.isHidden = true
                    playerWonLabel.isHidden = false
                    playerWonLabel.text = playerOne! + " won"
                    playAgainButton.isHidden = false
                    game.gameState = [1, 1, 1, 1, 1, 1, 1, 1, 1]
                    
                    // Adds one to score
                    playerOneScore += 1
                    playerOneScoreLabel.text = String(playerOneScore)
                    
                } else {
                    
                    // If player two is a real player, the name is displayed as "your turn"
                    if playerTwo != "CPU" {
                        playersTurnLabel.text = playerTwo! + ", it is your turn!"
                    }
                    
                    // *************************
                    // CPU PLAY
                    
                    // Variable to keep track of position in gameState (index 0 = 1, which equals tags on buttons)
                    var a = 0
                    
                    // Extra check to see if playerTwo is CPU, and that it is playerTwo's turn
                    if playerTwo == "CPU" && game.activePlayer == 2 {
                        
                        // Empties list of possibile choices for CPU
                        cpuPossibilities.removeAll()
                        
                        // Adds all possible choices from gameState to cpuPossibilities
                        for i in game.gameState {
                            a += 1
                            if i == 0 {
                                cpuPossibilities.append(a)
                            }
                        }
                        
                        // Extracts random number from list of possible choices
                        let cpuRandomChoice = cpuPossibilities.randomElement()!
                        
                        // Changes the random choice to 2 in gameState
                        game.gameState[cpuRandomChoice - 1] = 2
                        
                        // Changes the image of the random choice
                        let cpuChoiceButton = self.view.viewWithTag(cpuRandomChoice) as! UIButton
                        cpuChoiceButton.setImage(UIImage(named: "circle"), for: UIControl.State())
                        
                        // Changes the player to player one
                        game.changePlayer()
                        
                    //*****************************
                        
                        // Check to see if player two (CPU) is a winner
                        let winner = game.checkForWinner()
                        if winner != 0 {
                            game.gameIsActive = false
                            playersTurnLabel.isHidden = true
                            playerWonLabel.isHidden = false
                            playerWonLabel.text = playerTwo! + " won"
                            playAgainButton.isHidden = false
                            game.gameState = [2, 2, 2, 2, 2, 2, 2, 2, 2]
                            
                            // Adds one to score
                            playerTwoScore += 1
                            playerTwoScoreLabel.text = String(playerTwoScore)
                        }
                    }
                }
            
            // If activePlayer is not 1, it is player two's turn. Changes the image of button choice accordingly
            } else {
                sender.setImage(UIImage(named: "circle"), for: UIControl.State())
                
                //Changes the activePlayer to playerOne, and displays the name
                game.changePlayer()
                
                //Checks if player two is a winner
                let winner = game.checkForWinner()
                if winner != 0 {
                    game.gameIsActive = false
                    playersTurnLabel.isHidden = true
                    playerWonLabel.text = playerTwo! + " won"
                    playAgainButton.isHidden = false
                    playerWonLabel.isHidden = false
                    game.gameState = [2, 2, 2, 2, 2, 2, 2, 2, 2]
                    
                    // Adds one to score
                    playerTwoScore += 1
                    playerTwoScoreLabel.text = String(playerTwoScore)
                }
                playersTurnLabel.text = playerOne! + ", it is your turn!"
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
        if game.gameIsActive == false && game.checkForWinner() == 0 {
            playerWonLabel.text = "It was a draw.."
            playerWonLabel.isHidden = false
            playAgainButton.isHidden = false
            playersTurnLabel.isHidden = true
        }
    }
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    // Function for the playAgainButton
    @IBAction func playAgain(_ sender: UIButton) {
        
        // Resets gameState, gameIsActive and activePlayer
        game.resetGame()
        
        // Displays whose turn it is
        playersTurnLabel.isHidden = false
        playersTurnLabel.text = playerOne! + ", it is your turn!"
        
        // And the playAgainButton and playerWonLabel is not visible
        playAgainButton.isHidden = true
        playerWonLabel.isHidden = true
        
        // The images are removed from the buttons to clear the board
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
}


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
