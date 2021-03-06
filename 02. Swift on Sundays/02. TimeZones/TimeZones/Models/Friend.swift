//
//  Friend.swift
//  TimeZones
//
//  Created by Neil Hiddink on 1/13/19.
//  Copyright © 2019 Neil Hiddink. All rights reserved.
//

import Foundation

struct Friend: Codable {
    var name: String
    var timeZone = TimeZone.current
}
