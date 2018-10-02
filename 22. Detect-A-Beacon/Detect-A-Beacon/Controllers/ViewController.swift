//
//  ViewController.swift
//  Detect-A-Beacon
//
//  Created by Neil Hiddink on 10/2/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit
import CoreLocation

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var locationManager: CLLocationManager!
    
    // MARK: - IB Outlets
    
    @IBOutlet var distanceReading: UILabel!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }

}

// MARK: - ViewController: CLLocationManagerDelegate

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways && CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
            if CLLocationManager.isRangingAvailable() {
                
            }
        }
    }
}

