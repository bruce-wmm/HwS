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

class GameViewController: UIViewController {

    override var shouldAutorotate: Bool { return true }
    override var prefersStatusBarHidden: Bool { return true }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = self.view as! SKView? {
            
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

}
