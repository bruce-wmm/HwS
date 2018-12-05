//
//  Commit+CoreDataProperties.swift
//  GitHubCommits
//
//  Created by Neil Hiddink on 12/4/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//
//

import Foundation
import CoreData


extension Commit {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Commit> {
        return NSFetchRequest<Commit>(entityName: "Commit")
    }

    @NSManaged public var date: Date
    @NSManaged public var message: String
    @NSManaged public var sha: String
    @NSManaged public var url: String

}
