//
//  SpeechTextViewController.swift
//  SpeechMemorizer
//
//  Created by Neil Hiddink on 1/12/19.
//  Copyright © 2019 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: - SpeechTextViewController: UIViewController

class SpeechTextViewController: UIViewController {
    
    // MARK: Properties
    
    var speech: SpeechItem!
    
    // MARK: IB Outlets
    
    @IBOutlet var textView: UITextView!
    
    // MARK: View Life Cycle
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assert(speech != nil, "You must provide a speech item before trying to show this view controller.")
        
        showText()
    }
    
    // MARK: Helper Methods
    
    fileprivate func showText() {
        textView.text = speech.text
    }
}
