//
//  GameViewController.swift
//  ExplodingMonkeys
//
//  Created by Neil Hiddink on 10/27/18.
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
    var currentGame: GameScene!
    
    // MARK: - IB Outlets
    
    @IBOutlet var angleSlider: UISlider!
    @IBOutlet var angleLabel: UILabel!
    @IBOutlet var velocitySlider: UISlider!
    @IBOutlet var velocityLabel: UILabel!
    @IBOutlet var launchButton: UIButton!
    @IBOutlet var playerNumber: UILabel!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        angleChanged(angleSlider)
        velocityChanged(velocitySlider)
        
        if let view = self.view as! SKView? {
            if let scene = SKScene(fileNamed: "GameScene") {
                scene.scaleMode = .aspectFit
                
                view.presentScene(scene)
                currentGame = scene as! GameScene
                currentGame.viewController = self
            }
            
            view.ignoresSiblingOrder = true
            view.showsPhysics = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    // MARK: - Helper Methods
    
    func activatePlayer(number: Int) {
        if number == 1 {
            playerNumber.text = "<<< PLAYER ONE"
        } else {
            playerNumber.text = "PLAYER TWO >>>"
        }
        angleSlider.isHidden = false
        angleLabel.isHidden = false
        velocitySlider.isHidden = false
        velocityLabel.isHidden = false
        launchButton.isHidden = false
    }
    
    // MARK: - IB Actions
    
    @IBAction func angleChanged(_ sender: UISlider) {
        angleLabel.text = "Angle: \(Int(angleSlider.value))°"
    }
    
    @IBAction func velocityChanged(_ sender: UISlider) {
        velocityLabel.text = "Velocity: \(Int(velocitySlider.value))"
    }
    
    @IBAction func launchButtonPressed(_ sender: UIButton) {
        angleSlider.isHidden = true
        angleLabel.isHidden = true
        velocitySlider.isHidden = true
        velocityLabel.isHidden = true
        launchButton.isHidden = true
        currentGame.launch(angle: Int(angleSlider.value), velocity: Int(velocitySlider.value))
    }
}
