//
//  Coordinator.swift
//  TimeZones
//
//  Created by Neil Hiddink on 1/24/19.
//  Copyright © 2019 Neil Hiddink. All rights reserved.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
