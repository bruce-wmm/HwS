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
        imageView.frame.size = CGSize(width: 150, height: 150)
        imageView.center = CGPoint(x: 512, y: view.frame.height / 2)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
    }
    
    // MARK: IB Actions
    
    @IBAction func tapped(_ sender: UIButton) {
        tap.isHidden = true
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: { [unowned self] in
            switch self.currentAnimation {
                case 0:
                    break
                default:
                    break
            }
        }) { [unowned self] (finished: Bool) in
            self.tap.isHidden = false
        }
        currentAnimation += 1
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }
    
}

