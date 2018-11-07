//
//  GameScene.swift
//  ConnectFour
//
//  Created by Neil Hiddink on 11/7/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import SpriteKit
import GameplayKit

// MARK: - GameScene: SKScene

class GameScene: SKScene {
    
    // MARK: - Scene Life Cycle
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    // MARK: - Touch Methods
    
    func touchDown(at location: CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first { touchDown(at: touch.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first { touchDown(at: touch.location(in: self)) }
    }
    
}
