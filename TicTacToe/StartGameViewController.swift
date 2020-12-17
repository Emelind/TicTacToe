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
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
    }
    
    // Action connected to Start Game Button
    @IBAction func startGame(_ sender: UIButton) {
        
        // Performs the segue to ViewController
        performSegue(withIdentifier: segueToGame, sender: self)
        
    }
}
