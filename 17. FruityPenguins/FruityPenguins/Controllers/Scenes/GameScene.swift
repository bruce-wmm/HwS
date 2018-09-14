//
//  GameScene.swift
//  FruityPenguins
//
//  Created by Neil Hiddink on 9/6/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // MARK: Properties
    
    var scoreLabel: SKLabelNode!
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    var livesImages = [SKSpriteNode]()
    var lives = 3
    
    var activeSliceBG: SKShapeNode!
    var activeSliceFG: SKShapeNode!
    
    // MARK: Scene Life Cycle
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "sliceBackground")
        background.anchorPoint = CGPoint(x: 0, y: 0)
        background.position = CGPoint(x: 0, y: 0)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -6)
        physicsWorld.speed = 0.85
        
        createScore()
        createLives()
        createSlices()
    }
    
    // MARK: Helper Methods
    
    func createScore() {
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.text = "Score: 0"
        scoreLabel.horizontalAlignmentMode = .left
        scoreLabel.fontSize = 48
        scoreLabel.position = CGPoint(x: 8, y: 8)
        addChild(scoreLabel)
    }
    
    func createLives() {
        for i in 0 ..< 3 {
            let spriteNode = SKSpriteNode(imageNamed: "sliceLife")
            spriteNode.position = CGPoint(x: CGFloat(834 + (i * 70)), y: 720)
            addChild(spriteNode)
            livesImages.append(spriteNode)
        }
    }
    
    func createSlices() {
        activeSliceBG = SKShapeNode()
        activeSliceBG.zPosition = 2
        activeSliceFG = SKShapeNode()
        activeSliceFG.zPosition = 2
        activeSliceBG.strokeColor = UIColor(red: 1, green: 0.9,
                                            blue: 0, alpha: 1)
        activeSliceBG.lineWidth = 9
        activeSliceFG.strokeColor = UIColor.white
        activeSliceFG.lineWidth = 5
        addChild(activeSliceBG)
        addChild(activeSliceFG)
    }
}
