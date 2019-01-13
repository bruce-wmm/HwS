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
    
    let visibleText: [NSAttributedString.Key: Any] = [
        .font: UIFont(name: "Georgia", size: 28)!,
        .foregroundColor: UIColor.black
    ]
    
    let invisibleText: [NSAttributedString.Key: Any] = [
        .font: UIFont(name: "Georgia", size: 28)!,
        .foregroundColor: UIColor.clear,
        .strikethroughStyle: 1,
        .strikethroughColor: UIColor.black
    ]
    
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
        let output = NSMutableAttributedString()
        
        let space = NSAttributedString(string: " ", attributes: visibleText)
        
        for (i, word) in words.enumerated() {
            if i < blankCounter {
                let attributedWord = NSAttributedString(string: word, attributes: visibleText)
                output.append(attributedWord)
            } else {
                var strippedWord = word
                var punctuation: String?
                
                if ",.\n".contains(word.last!) {
                    punctuation = String(strippedWord.removeLast())
                }
                
                let attributedWord = NSAttributedString(string: word, attributes: invisibleText)
                output.append(attributedWord)
            }
            
            output.append(space)
        }
        
        textView.attributedText = output
    }
    
    @objc fileprivate func wordsTapped() {
        blankCounter += 1
        showText()
    }
}
