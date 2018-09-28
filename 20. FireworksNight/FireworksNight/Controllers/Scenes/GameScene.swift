//
//  GameScene.swift
//  FireworksNight
//
//  Created by Neil Hiddink on 9/28/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import SpriteKit
import GameplayKit

// MARK: - GameScene: SKScene

class GameScene: SKScene {

    // MARK: - Properties
    
    var gameTimer: Timer!
    var fireworks = [SKNode]()
    let leftEdge = -22
    let bottomEdge = -22
    let rightEdge = 1024 + 22
    var score = 0 {
        didSet {
            
        }
    }
    
    // MARK: - Scene Life Cycle
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        let background = SKSpriteNode(imageNamed: "background")
        background.anchorPoint = CGPoint.zero
        background.position = CGPoint.zero
        background.size = CGSize(width: frame.width, height: frame.height)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)

        gameTimer = Timer.scheduledTimer(timeInterval: 6, target: self, selector: #selector(launchFireworks),
                                         userInfo: nil, repeats: true)
    }
    
    // MARK: - Helper Methods
    
    func createFirework(xMovement: CGFloat, x: Int, y: Int) {
        let node = SKNode()
        node.position = CGPoint(x: x, y: y)

        let firework = SKSpriteNode(imageNamed: "rocket")
        firework.colorBlendFactor = 1
        firework.name = "firework"
        node.addChild(firework)
        
        switch GKRandomSource.sharedRandom().nextInt(upperBound: 3) {
            case 0:
                firework.color = .cyan
            case 1:
                firework.color = .green
            case 2:
                firework.color = .red
            default:
                break
        }
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: xMovement, y: 1000))

        let move = SKAction.follow(path.cgPath, asOffset: true, orientToPath: true, speed: 200)
        node.run(move)

        let emitter = SKEmitterNode(fileNamed: "fuse")!
        emitter.position = CGPoint(x: 0, y: -22)
        node.addChild(emitter)

        fireworks.append(node)
        addChild(node)
    }
    
    @objc func launchFireworks() {
        let movementAmount: CGFloat = 1800
        let coefficients = [0, -200, -100, 100, 200]
        switch GKRandomSource.sharedRandom().nextInt(upperBound: 4) {
            case 0: // fire five, straight up
                for i in 0...4 {
                    createFirework(xMovement: 0, x: 512 - coefficients[i], y: bottomEdge)
                }
            case 1: // fire five, in a fan
                
                for i in 0...4 {
                    createFirework(xMovement: CGFloat(coefficients[i]), x: 512 - coefficients[i], y: bottomEdge)
                }
            case 2: // fire five, from the left to the right
                for i in 0...4 {
                    createFirework(xMovement: movementAmount, x: rightEdge, y: bottomEdge + (100 * i))
                }
            case 3: // fire five, from the right to the left
                for i in 0...4 {
                    createFirework(xMovement: -movementAmount, x: rightEdge, y: bottomEdge + (100 * i))
                }
            default:
                break
        }
    }
}
