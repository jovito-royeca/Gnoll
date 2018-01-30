//
//  License+CoreDataProperties.swift
//  Gnoll
//
//  Created by Jovito Royeca on 30/01/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//
//

import Foundation
import CoreData


extension License {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<License> {
        return NSFetchRequest<License>(entityName: "License")
    }

    @NSManaged public var key: String?
    @NSManaged public var name: String?
    @NSManaged public var spdxId: String?
    @NSManaged public var url: String?
    @NSManaged public var repositories: NSSet?

}

// MARK: Generated accessors for repositories
extension License {

    @objc(addRepositoriesObject:)
    @NSManaged public func addToRepositories(_ value: Repository)

    @objc(removeRepositoriesObject:)
    @NSManaged public func removeFromRepositories(_ value: Repository)

    @objc(addRepositories:)
    @NSManaged public func addToRepositories(_ values: NSSet)

    @objc(removeRepositories:)
    @NSManaged public func removeFromRepositories(_ values: NSSet)

}
