//
//  GameScene.swift
//  MarbleMaze
//
//  Created by Neil Hiddink on 10/21/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import SpriteKit
import GameplayKit

struct PhysicsCategory {
    static let Player: UInt32 = 0b1 // 1
    static let Wall: UInt32 = 0b10 // 2
    static let Star: UInt32 = 0b100 // 4
    static let Vortex: UInt32 = 0b1000 // 8
    static let Finish: UInt32 = 0b10000 // 16
}

class GameScene: SKScene {
    
    // MARK: - Properties
    
    // MARK: - Scene Life Cycle
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        loadLevel()
    }
    
    override func update(_ currentTime: TimeInterval) {

    }
    
    // MARK: - Helper Methods
    
    func loadLevel() {
        if let levelPath = Bundle.main.path(forResource: "level1", ofType: "txt") {
            if let levelString = try? String(contentsOfFile: levelPath) {
                let lines = levelString.components(separatedBy: "\n")
                for (row, line) in lines.reversed().enumerated() {
                    for (column, letter) in line.enumerated() {
                        let position = CGPoint(x: (64 * column) + 32, y: (64 * row) + 32)
                        if letter == "x" {
                            let node = SKSpriteNode(imageNamed: "block")
                            node.position = position
                            node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
                            node.physicsBody?.categoryBitMask = PhysicsCategory.Wall
                            node.physicsBody?.isDynamic = false
                            addChild(node)
                        } else if letter == "v"  {
                            let node = SKSpriteNode(imageNamed: "vortex")
                            node.name = "vortex"
                            node.position = position
                            node.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat.pi, duration: 1)))
                            node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                            node.physicsBody?.isDynamic = false
                            node.physicsBody?.categoryBitMask = PhysicsCategory.Vortex
                            node.physicsBody?.contactTestBitMask = PhysicsCategory.Player
                            node.physicsBody?.collisionBitMask = 0
                            addChild(node)
                        } else if letter == "s"  {
                            let node = SKSpriteNode(imageNamed: "star")
                            node.name = "star"
                            node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                            node.physicsBody?.isDynamic = false
                            node.physicsBody?.categoryBitMask = PhysicsCategory.Star
                            node.physicsBody?.contactTestBitMask = PhysicsCategory.Star
                            node.physicsBody?.collisionBitMask = 0
                            node.position = position
                            addChild(node)
                        } else if letter == "f"  {
                            let node = SKSpriteNode(imageNamed: "finish")
                            node.name = "finish"
                            node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                            node.physicsBody?.isDynamic = false
                            node.physicsBody?.categoryBitMask = PhysicsCategory.Finish
                            node.physicsBody?.contactTestBitMask = PhysicsCategory.Finish
                            node.physicsBody?.collisionBitMask = 0
                            node.position = position
                            addChild(node)
                        }
                    }
                }
            }
        }
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
