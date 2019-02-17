//
//  AppDelegate.swift
//  Project30
//
//  Created by TwoStraws on 20/08/2016.
//  Copyright (c) 2016 TwoStraws. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		
		let vc = SelectionViewController(style: .plain)
		let nc = UINavigationController(rootViewController: vc)
		window?.rootViewController = nc
		window?.makeKeyAndVisible()

		return true
	}

}

