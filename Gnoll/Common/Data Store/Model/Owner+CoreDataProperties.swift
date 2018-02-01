//
//  Owner+CoreDataProperties.swift
//  Gnoll
//
//  Created by Jovito Royeca on 31/01/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//
//

import Foundation
import CoreData


extension Owner {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Owner> {
        return NSFetchRequest<Owner>(entityName: "Owner")
    }

    @NSManaged public var avatarURL: String?
    @NSManaged public var eventsURL: String?
    @NSManaged public var followersURL: String?
    @NSManaged public var followingURL: String?
    @NSManaged public var gistsURL: String?
    @NSManaged public var htmlURL: String?
    @NSManaged public var id: Int64
    @NSManaged public var login: String?
    @NSManaged public var organizationsURL: String?
    @NSManaged public var ownerType: String?
    @NSManaged public var receivedEventsURL: String?
    @NSManaged public var reposURL: String?
    @NSManaged public var siteAdmin: Bool
    @NSManaged public var starredURL: String?
    @NSManaged public var subscriptionsURL: String?
    @NSManaged public var url: String?
    @NSManaged public var repositories: NSSet?

}

// MARK: Generated accessors for repositories
extension Owner {

    @objc(addRepositoriesObject:)
    @NSManaged public func addToRepositories(_ value: Repository)

    @objc(removeRepositoriesObject:)
    @NSManaged public func removeFromRepositories(_ value: Repository)

    @objc(addRepositories:)
    @NSManaged public func addToRepositories(_ values: NSSet)

    @objc(removeRepositories:)
    @NSManaged public func removeFromRepositories(_ values: NSSet)

}
