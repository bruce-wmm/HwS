//
//  ViewController.swift
//  Animation
//
//  Created by Neil Hiddink on 8/27/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Properties
    
    var imageView: UIImageView!
    var currentAnimation = 0
    
    // MARK: IB Outlets
    
    @IBOutlet var tap: UIButton!
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: 512, y: 384)
        view.addSubview(imageView)
    }
    
    // MARK: IB Actions
    
    @IBAction func tapped(_ sender: UIButton) {
        currentAnimation += 1
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }
    
}

