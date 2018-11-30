//
//  InterfaceController.swift
//  PsychicTester WatchKit Extension
//
//  Created by Neil Hiddink on 11/24/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

// MARK: - InterfaceController: WKInterfaceController

class InterfaceController: WKInterfaceController {

    // MARK: - IB Outlets
    
    @IBOutlet var welcomeText: WKInterfaceLabel!
    @IBOutlet var hideButton: WKInterfaceButton!
    
    // MARK: - Interface Life Cycle
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    override func willActivate() {
        super.willActivate()
        
    }
    
    override func didDeactivate() {
        super.didDeactivate()
        
    }
    
    // MARK: - IB Actions

    @IBAction func hideWelcomeText() {
        welcomeText.setHidden(true)
        hideButton.setHidden(true)
    }
}

// MARK: - InterfaceController: WCSessionDelegate

extension InterfaceController: WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) { }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        WKInterfaceDevice().play(.click)
    }
}
