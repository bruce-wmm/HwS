//
//  ViewController.swift
//  LocalNotifications
//
//  Created by Neil Hiddink on 9/29/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit
import UserNotifications

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var center = UNUserNotificationCenter.current()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(registerLocal))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Schedule", style: .plain, target: self, action: #selector(scheduleLocal))
    }
    
    // MARK: Helper Methods
    
    @objc func registerLocal() {
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Success")
            } else {
                print("Something went wrong...")
            }
        }
    }
    
    @objc func scheduleLocal() {
    
    }

}

