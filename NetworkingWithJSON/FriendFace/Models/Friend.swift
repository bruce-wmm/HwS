//
//  Friend.swift
//  FriendFace
//
//  Created by Neil Hiddink on 1/27/19.
//  Copyright © 2019 Neil Hiddink. All rights reserved.
//

import UIKit

struct Friend: Codable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Connection]
}
