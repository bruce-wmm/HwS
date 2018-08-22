//
//  Person.swift
//  NamesToFaces
//
//  Created by Neil Hiddink on 8/15/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import Foundation

class Person: NSObject, NSCoding {
    
    // MARK: Properties
    
    var name: String
    var image: String
    
    // MARK: Initialization
    
    init(name: String, image: String){
        self.name = name
        self.image = image
    }
    
    // MARK: NSCoding Methods
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        image = aDecoder.decodeObject(forKey: "image") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(image, forKey: "image")
    }
}
