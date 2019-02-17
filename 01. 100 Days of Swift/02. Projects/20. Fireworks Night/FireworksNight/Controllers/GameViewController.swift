//
//  GameViewController.swift
//  FireworksNight
//
//  Created by Neil Hiddink on 9/28/18.
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
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = self.view as? SKView {
            
            let mode = SKSceneScaleMode.aspectFit
            switch UIDevice.current.model {
                case "iPhone":
                    if let scene = SKScene(fileNamed: "GameScene-iPhone") {
                        scene.scaleMode = mode
                        view.presentScene(scene)
                    }
                case "iPad":
                    if let scene = SKScene(fileNamed: "GameScene-iPad") {
                        scene.scaleMode = mode
                        view.presentScene(scene)
                    }
                default:
                    break
            }
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    // MARK: - Motion Methods
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if let view = self.view as? SKView {
            if let scene = view.scene as? GameScene {
                scene.explodeFireworks()
            }
        }
    }
    
}
