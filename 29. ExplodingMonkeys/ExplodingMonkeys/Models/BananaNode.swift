//
//  BananaNode.swift
//  ExplodingMonkeys
//
//  Created by Neil Hiddink on 10/28/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import Foundation
import SpriteKit

// MARK: - BananaNode: SKSpriteNode

class BananaNode: SKSpriteNode {
    
    // MARK: - Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
        name = "banana"
        setupPhysicsBody()
    }
    
    // MARK: - Helper Methods
    
    func setupPhysicsBody() {
        physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        physicsBody?.categoryBitMask = PhysicsCategory.Banana
        physicsBody?.contactTestBitMask = PhysicsCategory.Building | PhysicsCategory.Player
        physicsBody?.collisionBitMask = PhysicsCategory.Building | PhysicsCategory.Player
        physicsBody?.usesPreciseCollisionDetection = true
    }
    
}
