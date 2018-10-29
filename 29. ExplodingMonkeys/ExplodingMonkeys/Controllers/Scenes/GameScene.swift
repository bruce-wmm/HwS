//
//  GameScene.swift
//  ExplodingMonkeys
//
//  Created by Neil Hiddink on 10/27/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import SpriteKit
import GameplayKit

// MARK: - GameScene: SKScene

class GameScene: SKScene {
    
    // MARK: - Properties
    
    var buildings = [BuildingNode]()
    weak var viewController: GameViewController!
    
    var player1: SKSpriteNode!
    var player2: SKSpriteNode!
    var banana: SKSpriteNode!
    var currentPlayer = 1

    // MARK: - Scene Life Cycle
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        backgroundColor = UIColor(hue: 0.669, saturation: 0.99, brightness: 0.67, alpha: 1)
        createBuildings()
        createPlayers()
    }
    
    override func update(_ currentTime: TimeInterval) {

    }
    
    // MARK: - Helper Methods
    
    func createBuildings() {
        var currentX: CGFloat = -15
        while currentX < 1024 {
            let size = CGSize(width: RandomInt(min: 2, max: 4) * 40, height: RandomInt(min: 300, max: 600))
            currentX += size.width + 2
            let building = BuildingNode(color: UIColor.red, size: size)
            building.position = CGPoint(x: currentX - (size.width / 2), y: size.height / 2)
            building.setup()
            addChild(building)
            buildings.append(building)
        }
    }
    
    func createPlayers() {
        player1 = PlayerNode(texture: SKTexture(imageNamed: "player"), color: UIColor.clear, size: CGSize(width: 50.0, height: 50.0))
        player1.name = "player1"
        let player1Building = buildings[1]
        player1.position = CGPoint(x: player1Building.position.x,
                                   y: player1Building.position.y + ((player1Building.size.height + player1.size.height) / 2))
        addChild(player1)
        
        player2 = PlayerNode(texture: SKTexture(imageNamed: "player"), color: UIColor.clear, size: CGSize(width: 50.0, height: 50.0))
        player2.name = "player2"
        let player2Building = buildings[buildings.count - 2]
        player2.position = CGPoint(x: player2Building.position.x,
                                   y: player2Building.position.y + ((player2Building.size.height + player2.size.height) / 2))
        addChild(player2)
    }
    
    func launch(angle: Int, velocity: Int) {
        
    }
    
    // MARK: - Touch Methods
    
    func touchDown(at location: CGPoint) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first { self.touchDown(at: touch.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first { self.touchDown(at: touch.location(in: self)) }
    }
    
}
