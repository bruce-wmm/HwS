//
//  AppDelegate.swift
//  SwiftSearcher
//
//  Created by Neil Hiddink on 10/30/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit
import CoreSpotlight

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        if userActivity.activityType == CSSearchableItemActionType {
            if let uniqueIdentifier = userActivity.userInfo?[CSSearchableItemActivityIdentifier] as? String {
                if let navigationController = window?.rootViewController as? UINavigationController {
                    if let viewController = navigationController.topViewController as? ViewController {
                        viewController.showProject(Int(uniqueIdentifier)!)
                    }
                }
            }
        }
        return true
    }

}

