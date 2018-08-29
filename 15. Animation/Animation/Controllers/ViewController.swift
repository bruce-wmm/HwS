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
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [],
        //UIView.animate(withDuration: 1, delay: 0, options: [],
                       animations: { [unowned self] in
            switch self.currentAnimation {
                case 0:
                    self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
                case 1:
                    self.imageView.transform = CGAffineTransform.identity
                case 2:
                    self.imageView.transform = CGAffineTransform(translationX: -256, y: -256)
                case 3:
                    self.imageView.transform = CGAffineTransform.identity
                case 4:
                    self.imageView.transform = CGAffineTransform(rotationAngle:
                        CGFloat.pi)
                case 5:
                    self.imageView.transform = CGAffineTransform.identity
                case 6:
                    self.imageView.alpha = 0.1
                    self.imageView.backgroundColor = UIColor.green
                case 7:
                    self.imageView.alpha = 1
                    self.imageView.backgroundColor = UIColor.clear
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

