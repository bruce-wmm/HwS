//
//  WhackSlot.swift
//  WhackAPenguin
//
//  Created by Neil Hiddink on 8/26/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit
import SpriteKit

class WhackSlot: SKNode {
    func configure(at position: CGPoint) {
        self.position = position
        let sprite = SKSpriteNode(imageNamed: "whackHole")
        addChild(sprite)
    }
}
