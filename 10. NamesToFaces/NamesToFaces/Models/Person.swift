//
//  Person.swift
//  NamesToFaces
//
//  Created by Neil Hiddink on 8/15/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import Foundation

class Person: NSObject {
    
    var name: String
    var image: String
    
    init(name: String, image: String){
        self.name = name
        self.image = image
    }
}
