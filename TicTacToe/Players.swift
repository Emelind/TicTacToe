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
    
    private func addMockData() {
        list.append(Player(name: "Emelie", wins: 3))
        list.append(Player(name: "Micke", wins: 2))
        list.append(Player(name: "Soffan", wins: 1))
    }
    
}
