//
//  GameViewController.swift
//  SpaceRace
//
//  Created by Neil Hiddink on 10/18/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

// MARK: - GameViewController: UIViewController

class GameViewController: UIViewController {

    // MARK: - Properties
    
    override var shouldAutorotate: Bool { return true }
    override var prefersStatusBarHidden: Bool { return true }
    
    // MARK: - Scene Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = view as! SKView? {
            if let scene = SKScene(fileNamed: "GameScene") {
                scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                scene.scaleMode = .aspectFill
                
                view.presentScene(scene)
                
                view.ignoresSiblingOrder = true
                view.showsPhysics = true
                view.showsNodeCount = true
                view.showsFPS = true
            }
        }
    }
    
}
