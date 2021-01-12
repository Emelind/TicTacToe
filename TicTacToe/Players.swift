//
//  Players.swift
//  TicTacToe
//
//  Created by Emelie on 2021-01-10.
//

import Foundation

class Players {
    
    var list: [Player]
    
    init() {
        list = [Player]()
        
        addMockData()
    }
    
    var count : Int {
        return list.count
    }
    
    func get(atIndex: Int) -> Player {
        return list[atIndex]
    }
    
    func add(player: Player) {
        list.append(player)
    }
    
    private func addMockData() {
        list.append(Player(name: "Emelie", wins: 3))
        list.append(Player(name: "Micke", wins: 2))
    }
    
}
