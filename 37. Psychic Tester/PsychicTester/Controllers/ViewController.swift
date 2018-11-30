//
//  ViewController.swift
//  PsychicTester
//
//  Created by Neil Hiddink on 11/24/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit
import GameplayKit
import AVFoundation
import WatchConnectivity

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: - Properties
    
    var allCards = [CardViewController]()
    var musicPlayer: AVAudioPlayer!
    
    var lastMessage: CFAbsoluteTime = 0
    
    // MARK: - IB Outlets
    
    @IBOutlet var cardContainer: UIView!
    @IBOutlet var gradientView: UIView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createParticles()
        loadCards()
        playBackgroundMusic()
        
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let instructions = "Please ensure your Apple Watch is configured correctly. On your iPhone, launch Apple's 'Watch' configuration app then choose General > Wake Screen. On that screen, please disable Wake Screen On Wrist Raise, then select Wake For 70 Seconds. On your Apple Watch, please swipe up on your watch face and enable Silent Mode. You're done!"
        
        let alert = UIAlertController(title: "Adjust Settings", message: instructions, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "I'm ready.", style: .default))
        
        present(alert, animated: true)
    }

    // MARK: - Helper Methods
    
    @objc func loadCards() {
        
        view.isUserInteractionEnabled = true
        
        for card in allCards {
            card.view.removeFromSuperview()
            card.removeFromParent()
        }
        allCards.removeAll(keepingCapacity: true)
        
        let positions = [
            CGPoint(x: 75, y: 85),
            CGPoint(x: 185, y: 85),
            CGPoint(x: 295, y: 85),
            CGPoint(x: 405, y: 85),
            CGPoint(x: 75, y: 235),
            CGPoint(x: 185, y: 235),
            CGPoint(x: 295, y: 235),
            CGPoint(x: 405, y: 235)
        ]
        
        let circle = UIImage(named: "cardCircle")!
        let cross = UIImage(named: "cardCross")!
        let lines = UIImage(named: "cardLines")!
        let square = UIImage(named: "cardSquare")!
        let star = UIImage(named: "cardStar")!
        
        var images = [circle, circle, cross, cross, lines, lines, square, star]
        images = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: images) as! [UIImage]
        
        for (index, position) in positions.enumerated() {
            
            let card = CardViewController()
            card.delegate = self
            
            addChild(card)
            cardContainer.addSubview(card.view)
            card.didMove(toParent: self)
            
            card.view.center = position
            card.front.image = images[index]
                
            if card.front.image == star {
                card.isCorrect = true
            }
            
            allCards.append(card)
        }
    }
    
    func cardTapped(_ tapped: CardViewController) {
        guard view.isUserInteractionEnabled == true else { return }
        view.isUserInteractionEnabled = false
        
        for card in allCards {
            if card == tapped {
                card.wasTapped()
                card.perform(#selector(card.wasntTapped), with: nil, afterDelay: 1)
            } else {
                card.wasntTapped()
            }
        }
        perform(#selector(loadCards), with: nil, afterDelay: 2)
    }
    
    func createParticles() {
        let particleEmitter = CAEmitterLayer()
        particleEmitter.emitterPosition = CGPoint(x: view.frame.width / 2.0, y: -50)
        particleEmitter.emitterShape = CAEmitterLayerEmitterShape.line
        particleEmitter.emitterSize = CGSize(width: view.frame.width, height: 1)
        particleEmitter.renderMode = CAEmitterLayerRenderMode.additive
        let cell = CAEmitterCell()
        cell.birthRate = 2
        cell.lifetime = 5.0
        cell.velocity = 100
        cell.velocityRange = 50
        cell.emissionLongitude = .pi
        cell.spinRange = 5
        cell.scale = 0.5
        cell.scaleRange = 0.25
        cell.color = UIColor(white: 1, alpha: 0.1).cgColor
        cell.alphaSpeed = -0.025
        cell.contents = UIImage(named: "particle")?.cgImage
        particleEmitter.emitterCells = [cell]
        gradientView.layer.addSublayer(particleEmitter)
    }
    
    func playBackgroundMusic() {
        guard let musicURL = Bundle.main.url(forResource: "PhantomFromSpace", withExtension: ".mp3") else { return }
        
        if let player = try? AVAudioPlayer(contentsOf: musicURL) {
            musicPlayer = player
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
        }
    }
    
    func sendWatchMessage() {
        let currentTime = CFAbsoluteTimeGetCurrent()
        guard lastMessage + 0.5 < currentTime else { return }

        if (WCSession.default.isReachable) {
            let message = ["Message": "Hello"] // example message only
            WCSession.default.sendMessage(message, replyHandler: nil)
        }

        lastMessage = CFAbsoluteTimeGetCurrent()
    }

    // MARK: - Touch Methods
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        guard let touch = touches.first else { return }
        let location = touch.location(in: cardContainer)
        
        for card in allCards {
            if card.view.frame.contains(location) {
                if view.traitCollection.forceTouchCapability == .available {
                    if touch.force == touch.maximumPossibleForce {
                        card.front.image = UIImage(named: "cardStar")
                        card.isCorrect = true
                    }
                }
                
                if card.isCorrect {
                    sendWatchMessage()
                }
            }
        }
    }
    
}

// MARK: - ViewController: WCSessionDelegate

extension ViewController: WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) { }
    
    func sessionDidBecomeInactive(_ session: WCSession) { }
    
    func sessionDidDeactivate(_ session: WCSession) { }
    
}
