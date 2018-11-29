//
//  CardViewController.swift
//  PsychicTester
//
//  Created by Neil Hiddink on 11/28/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: - CardViewController: UIViewController

class CardViewController: UIViewController {

    // MARK: - Properties
    
    weak var delegate: ViewController!
    var front: UIImageView!
    var back: UIImageView!
    var isCorrect = false
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.bounds = CGRect(x: 0, y: 0, width: 100, height: 140)
        front = UIImageView(image: UIImage(named: "cardBack"))
        back = UIImageView(image: UIImage(named: "cardBack"))
        view.addSubview(front)
        view.addSubview(back)
        front.isHidden = true
        back.alpha = 0
        UIView.animate(withDuration: 0.2) {
            self.back.alpha = 1
        }
    }

}
