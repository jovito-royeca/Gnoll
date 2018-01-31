//
//  RepositoryQuery+CoreDataProperties.swift
//  Gnoll
//
//  Created by Jovito Royeca on 31/01/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//
//

import Foundation
import CoreData


extension RepositoryQuery {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RepositoryQuery> {
        return NSFetchRequest<RepositoryQuery>(entityName: "RepositoryQuery")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var incompleteResults: Bool
    @NSManaged public var query: String?
    @NSManaged public var totalCount: Int64
    @NSManaged public var items: NSSet?

}

// MARK: Generated accessors for items
extension RepositoryQuery {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: Repository)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: Repository)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}
