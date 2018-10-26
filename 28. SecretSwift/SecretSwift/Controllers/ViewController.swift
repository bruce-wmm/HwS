//
//  ViewController.swift
//  SecretSwift
//
//  Created by Neil Hiddink on 10/25/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet var secret: UITextView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard),
                                       name: UIWindow.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard),
                                       name: UIWindow.keyboardWillChangeFrameNotification, object: nil)
    }
    
    // MARK: - Helper Methods
    
    @objc func adjustForKeyboard(notification: Notification) {
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame =  (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        if notification.name == UIWindow.keyboardWillHideNotification {
            secret.contentInset = UIEdgeInsets.zero
        } else {
            secret.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
        }
        secret.scrollIndicatorInsets = secret.contentInset
        let selectedRange = secret.selectedRange
        secret.scrollRangeToVisible(selectedRange)
    }
    
    // MARK: - IB Actions
    
    @IBAction func authenticateTapped(_ sender: UIButton) {
        
    }
}

