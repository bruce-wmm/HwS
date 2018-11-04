//
//  Tune.swift
//  NameThatTune
//
//  Created by Neil Hiddink on 11/3/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit
import CloudKit

class Tune: NSObject {
    
    var recordID: CKRecord.ID!
    var genre: String!
    var comments: String!
    var audio: URL!
    
}
