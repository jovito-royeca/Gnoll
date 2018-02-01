//
//  MyRepositoryQuery+CoreDataProperties.swift
//  Gnoll
//
//  Created by Jovito Royeca on 01/02/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//
//

import Foundation
import CoreData


extension MyRepositoryQuery {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyRepositoryQuery> {
        return NSFetchRequest<MyRepositoryQuery>(entityName: "MyRepositoryQuery")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var incompleteResults: Bool
    @NSManaged public var totalCount: Int64
    @NSManaged public var items: NSSet?

}

// MARK: Generated accessors for items
extension MyRepositoryQuery {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: Repository)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: Repository)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}
