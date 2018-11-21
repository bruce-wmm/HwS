//
//  GameScene.swift
//  CrashyPlane
//
//  Created by Neil Hiddink on 11/19/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import SpriteKit

// MARK: - GameScene: SKScene

class GameScene: SKScene {
    
    // MARK: - Properties
    
    var player: SKSpriteNode!
    
    // MARK: - Scene Life Cycle
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        createPlayer()
    }
    
    // MARK: - Helper Methods
    
    func createPlayer() {
        let playerTexture = SKTexture(imageNamed: "player-1")
        player = SKSpriteNode(texture: playerTexture)
        player.zPosition = 10
        player.position = CGPoint(x: frame.width / 6, y: frame.height * 0.75)
        addChild(player)
        let frame2 = SKTexture(imageNamed: "player-2")
        let frame3 = SKTexture(imageNamed: "player-3")
        let animation = SKAction.animate(with: [playerTexture, frame2, frame3, frame2], timePerFrame: 0.01)
        let runForever = SKAction.repeatForever(animation)
        player.run(runForever)
    }
    
    // MARK: - Touch Methods
    
    func touchDown(at location: CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first { touchDown(at: touch.location(in: self)) }
    }
}
