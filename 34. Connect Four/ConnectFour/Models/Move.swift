//
//  Move.swift
//  ConnectFour
//
//  Created by Neil Hiddink on 11/15/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import GameplayKit
import UIKit

class Move: NSObject, GKGameModelUpdate {
    var value: Int = 0
    var column: Int
    init(column: Int) {
        self.column = column
    }
}
