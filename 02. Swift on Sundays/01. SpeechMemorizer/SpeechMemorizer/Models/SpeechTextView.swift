//
//  SpeechTextView.swift
//  SpeechMemorizer
//
//  Created by Neil Hiddink on 1/13/19.
//  Copyright © 2019 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: - SpeechTextView: UITextView

class SpeechTextView: UITextView {

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
    
}
