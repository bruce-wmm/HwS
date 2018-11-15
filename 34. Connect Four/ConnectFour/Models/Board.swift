//
//  Board.swift
//  ConnectFour
//
//  Created by Neil Hiddink on 11/12/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

enum ChipColor: Int {
    case none = 0
    case red
    case black
}

// MARK: - Board: NSObject

class Board: NSObject {

    // MARK: - Properties
    
    static var width = 7
    static var height = 6
    var slots = [ChipColor]()
    var currentPlayer: Player
    
    // MARK: - Initialization
    
    override init() {
        currentPlayer = Player.allPlayers[0]
        for _ in 0 ..< Board.width * Board.height {
            slots.append(.none)
        }
        super.init()
    }
    
    // MARK: - Helper Methods
    
    func chip(inColumn column: Int, row: Int) -> ChipColor {
        return slots[row + column * Board.height]
    }
    
    func set(chip: ChipColor, in column: Int, row: Int) {
        slots[row + column * Board.height] = chip
    }
    
    func nextEmptySlot(in column: Int) -> Int? {
        for row in 0 ..< Board.height {
            if chip(inColumn: column, row: row) == .none {
                return row
            }
        }
        return nil
    }
    
    func canMove(in column: Int) -> Bool {
        return nextEmptySlot(in: column) != nil
    }
    
    func add(chip: ChipColor, in column: Int) {
        if let row = nextEmptySlot(in: column) {
            set(chip: chip, in: column, row: row)
        }
    }
    
    func isFull() -> Bool {
        return false
    }
    
    func isWin(for player: Player) -> Bool {
        return false
    }
    
}
