//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Neil Hiddink on 8/1/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Properties
    
    var imageName: String?
    
    // MARK: IB Outlets
    
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var middleButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: IB Actions
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        
    }
    
}

