//
//  ViewController.swift
//  NameThatTune
//
//  Created by Neil Hiddink on 11/1/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Name that Tune"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTune))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: nil, action: nil)
    }
    
    // MARK: - Helper Methods
    
    @objc func addTune() {
        let recordVC = RecordTuneViewController()
        navigationController?.pushViewController(recordVC, animated: true)
    }

}

