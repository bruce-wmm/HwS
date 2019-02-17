//
//  ViewController.swift
//  Debugging
//
//  Created by Neil Hiddink on 9/18/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Debug with print statements
        print("Hello, world!")
        
        // Debug with assert statements
        assert(1 == 1, "DANGER. WILL. ROBINSON.")
        
        // Debug with breakpoints
        for i in 1 ... 100 {
            print("Got number \(i)")
        }
    }

}

