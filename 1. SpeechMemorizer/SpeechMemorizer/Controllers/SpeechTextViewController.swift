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
    var blankCounter = 0
    
    // MARK: IB Outlets
    
    @IBOutlet var textView: UITextView!
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assert(speech != nil, "You must provide a speech item before trying to show this view controller.")
        showText()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(wordsTapped))
        textView.addGestureRecognizer(tapRecognizer)
    }
    
    // MARK: Helper Methods
    
    fileprivate func showText() {
        let words = speech.text.components(separatedBy: " ")
        var output = ""
        
        for (i, word) in words.enumerated() {
            if i < blankCounter {
                output += "\(word) "
            } else {
                let blank = String(repeating: "_", count: word.count)
                output += "\(blank) "
            }
        }
        
        textView.text = output
    }
    
    @objc fileprivate func wordsTapped() {
        blankCounter += 1
        showText()
    }
}
