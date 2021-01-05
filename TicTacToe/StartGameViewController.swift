//
//  StartGameViewController.swift
//  TicTacToe
//
//  Created by Emelie on 2020-12-17.
//

import UIKit

class StartGameViewController: UIViewController {
    
    // Id of segue stored in variable segueToGame
    let segueToGame = "segueToGame"
    
    // Outlet for Player 1 name
    @IBOutlet weak var playerOneTextField: UITextField!
    
    //Outlet for Player 2 name
    @IBOutlet weak var playerTwoTextField: UITextField!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
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
            destinationVC.playerOne = playerOneTextField.text
            destinationVC.playerTwo = playerTwoTextField.text
        }
    }
    
    @IBAction func unwindToStartView(segue: UIStoryboardSegue) {
    }
}
