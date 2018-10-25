//
//  ViewController.swift
//  CoreGraphicsDemo
//
//  Created by Neil Hiddink on 10/24/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: - Properties
    
    var currentDrawType = 0
    
    // MARK: - IB Outlets
    
    @IBOutlet var imageView: UIImageView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawRectangle()
    }
    
    // MARK: Helper Methods
    
    func drawRectangle() {
        
    }
    
    // MARK: - IB Actions
    
    @IBAction func redrawTapped(_ sender: UIButton) {
        currentDrawType += 1
        if currentDrawType > 5 {
            currentDrawType = 0
        }
        switch currentDrawType {
        case 0:
            drawRectangle()
        default:
            break
        }
    }
    
}

