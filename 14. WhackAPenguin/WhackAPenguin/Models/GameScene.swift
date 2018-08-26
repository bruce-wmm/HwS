//
//  GameScene.swift
//  WhackAPenguin
//
//  Created by Neil Hiddink on 8/24/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import SpriteKit

// MARK: GameScene: SKScene

class GameScene: SKScene {
    
    // MARK: Properties
    
    var gameScore: SKLabelNode!
    var score = 0 {
        didSet {
            gameScore.text = "Score: \(score)"
        }
    }
    
    override func didMove(to view: SKView) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}
