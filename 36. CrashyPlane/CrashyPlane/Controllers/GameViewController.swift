//
//  GameViewController.swift
//  CrashyPlane
//
//  Created by Neil Hiddink on 11/19/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit
import SpriteKit

// MARK: - GameViewController: UIViewController

class GameViewController: UIViewController {
    
    // MARK: - Properties
    
    override var shouldAutorotate: Bool { return true }
    override var prefersStatusBarHidden: Bool { return true }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            if let scene = SKScene(fileNamed: "GameScene") {
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
            }
            view.ignoresSiblingOrder = true
            view.showsPhysics = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
}
