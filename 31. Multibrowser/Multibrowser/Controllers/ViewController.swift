//
//  ViewController.swift
//  Multibrowser
//
//  Created by Neil Hiddink on 10/29/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: ViewController: UIViewController

class ViewController: UIViewController {

    //MARK: - Properties
    
    
    
    //MARK: - IB Outlets
    
    @IBOutlet var addressBar: UITextField!
    @IBOutlet var stackView: UIStackView!
    
    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

//MARK: - ViewController: UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    
}

