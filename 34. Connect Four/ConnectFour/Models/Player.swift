//
//  Player.swift
//  ConnectFour
//
//  Created by Neil Hiddink on 11/14/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit
import GameplayKit

// MARK: - Player: NSObject, GKGameModelPlayer

class Player: NSObject, GKGameModelPlayer {

    // MARK:  - Properties
    
    var chip: ChipColor
    var color: UIColor
    var name: String
    var playerId: Int
    static var allPlayers = [Player(chip: .red), Player(chip: .black)]
    
    init(chip: ChipColor) {
        self.chip = chip
        self.playerId = chip.rawValue
        if chip == .red {
            color = .red
            name = "Red"
        } else {
            color = .black
            name = "Black"
        }
        super.init()
    }
    
    var opponent: Player {
        if chip == .red {
            return Player.allPlayers[1]
        } else {
            return Player.allPlayers[0]
        }
    }
}
