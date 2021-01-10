//
//  StartGameViewController.swift
//  TicTacToe
//
//  Created by Emelie on 2020-12-17.
//

import UIKit

class StartGameViewController: UIViewController, UITableViewDataSource {
    
    let players = Players()
    let highScoreCellId = "highScoreCellId"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: highScoreCellId, for: indexPath) as! HighScoreTableViewCell
        
        let player = players.get(atIndex: indexPath.row)
        cell.nameLabel.text = player.name
        cell.winsLabel.text = String(player.wins)
        
        return cell
    }
    
    
    @IBOutlet weak var highScoreTableView: UITableView!
    
    // Id of segue stored in variable segueToGame
    let segueToGame = "segueToGame"
    
    // Outlet for Player 1 name
    @IBOutlet weak var playerOneTextField: UITextField!
    
    //Outlet for Player 2 name
    @IBOutlet weak var playerTwoTextField: UITextField!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        highScoreTableView.dataSource = self
        
        let highScoreCell = UINib(nibName: "HighScoreTableViewCell", bundle: nil)
        
        highScoreTableView.register(highScoreCell, forCellReuseIdentifier: highScoreCellId)
    }
    
    // Action connected to Start Game Button
    @IBAction func startGame(_ sender: UIButton) {
        
        // Performs the segue to ViewController
        performSegue(withIdentifier: segueToGame, sender: self)
        
    }
    
    // Will run just before the segue is performed
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Check that the segue is the intended segue
        if segue.identifier == segueToGame {
            let destinationVC = segue.destination as! ViewController
            
            //If the text fields are empty, the names are replaced with Player One and Player Two
            if playerOneTextField.text == "" {
                destinationVC.playerOne = "Player One"
            } else {
                destinationVC.playerOne = playerOneTextField.text
            }
            if playerTwoTextField.text == "" {
                destinationVC.playerTwo = "Player Two"
            } else {
                destinationVC.playerTwo = playerTwoTextField.text
            }
        }
    }
    
    @IBAction func unwindToStartView(segue: UIStoryboardSegue) {
    }
}
