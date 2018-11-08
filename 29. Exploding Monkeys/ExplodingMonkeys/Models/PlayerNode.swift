//
//  PlayerNode.swift
//  ExplodingMonkeys
//
//  Created by Neil Hiddink on 10/28/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import Foundation
import SpriteKit

// MARK: - 

class PlayerNode: SKSpriteNode {
    
    // MARK: - Properties
    
    // MARK: - Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
        setupPhysicsBody()
    }
    
    // MARK: - Helper Methods
    
    func setupPhysicsBody() {
        physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        physicsBody?.categoryBitMask = PhysicsCategory.Player
        physicsBody?.contactTestBitMask = PhysicsCategory.Banana
        physicsBody?.collisionBitMask = PhysicsCategory.Banana
        physicsBody?.isDynamic = false
    }
    
}
