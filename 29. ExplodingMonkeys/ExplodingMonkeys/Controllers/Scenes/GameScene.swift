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

    // MARK: - Scene Life Cycle
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        backgroundColor = UIColor(hue: 0.669, saturation: 0.99, brightness: 0.67, alpha: 1)
        createBuildings()
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
