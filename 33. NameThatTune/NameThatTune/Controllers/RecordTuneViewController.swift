//
//  RecordTuneViewController.swift
//  NameThatTune
//
//  Created by Neil Hiddink on 11/1/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: - RecordTuneViewController: UIViewController

class RecordTuneViewController: UIViewController {
    
    // MARK: - Properties
    
    var stackView: UIStackView!
    
    // MARK: - View Life Cycle
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.gray
        
        stackView = UIStackView()
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = UIStackView.Distribution.fillEqually
        stackView.alignment = .center
        stackView.axis = .vertical
        view.addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
