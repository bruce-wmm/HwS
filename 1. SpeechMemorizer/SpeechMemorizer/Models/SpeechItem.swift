//
//  SpeechItem.swift
//  SpeechMemorizer
//
//  Created by Neil Hiddink on 1/12/19.
//  Copyright © 2019 Neil Hiddink. All rights reserved.
//

import Foundation

struct SpeechItem: Codable { // structs get memberwise initializer automatically
    var title: String
    var text: String
    var author: String
    var date: String
}
