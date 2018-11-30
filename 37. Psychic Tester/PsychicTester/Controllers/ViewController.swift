//
//  ViewController.swift
//  PsychicTester
//
//  Created by Neil Hiddink on 11/24/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit
import GameplayKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: - Properties
    
    var allCards = [CardViewController]()
    
    // MARK: - IB Outlets
    
    @IBOutlet var cardContainer: UIView!
   
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCards()        
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
}

