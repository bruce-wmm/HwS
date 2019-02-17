//
//  MainCoordinator.swift
//  TimeZones
//
//  Created by Neil Hiddink on 1/24/19.
//  Copyright © 2019 Neil Hiddink. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func configure(friend: Friend) {
        let friendVC = FriendViewController.instantiate()
        friendVC.coordinator = self
        friendVC.friend = friend
        navigationController.pushViewController(friendVC, animated: true)
    }
    
    func update(friend: Friend) {
        guard let vc = navigationController.viewControllers.first as? ViewController else { return }
    }
}
