//
//  DetailViewController.swift
//  CapitalCities
//
//  Created by Neil Hiddink on 9/28/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: - DetailViewController: UIViewController

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var capital: Capital?
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var capitalTitleLabel: UILabel!
    @IBOutlet weak var capitalCoordinateLabel: UILabel!
    @IBOutlet weak var capitalInfoTextView: UITextView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        capitalInfoTextView.delegate = self
        
        guard let capital = self.capital else {
            print("Capital object was not sent to DetailVC.")
            return
        }
        
        capitalTitleLabel.text = capital.title
        capitalCoordinateLabel.text = "\([capital.coordinate.latitude, capital.coordinate.longitude])"
        capitalInfoTextView.text = "\(capital.info)"
    }
    
}

// MARK: - DetailViewController: UITextViewDelegate

extension DetailViewController: UITextViewDelegate {}
