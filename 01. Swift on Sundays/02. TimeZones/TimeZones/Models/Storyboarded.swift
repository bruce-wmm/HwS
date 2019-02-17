//
//  Storyboarded.swift
//  TimeZones
//
//  Created by Neil Hiddink on 1/24/19.
//  Copyright © 2019 Neil Hiddink. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded {
    static func instantiate() -> Self {
        let className = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
