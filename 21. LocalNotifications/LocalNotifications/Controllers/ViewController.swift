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
    
    let center = UNUserNotificationCenter.current()
    let content = UNMutableNotificationContent()
    
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
        center.removeAllPendingNotificationRequests()

        content.title = "Late wake up call"
        content.body = "The early bird catches the worm, but the second mouse gets the cheese."
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = UNNotificationSound.default
        var dateComponents = DateComponents()
        dateComponents.hour = 10
        dateComponents.minute = 30
//        let trigger = UNCalendarNotificationTrigger(dateMatching:dateComponents, repeats: true)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }

}

