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

    @NSManaged public var avatarUrl: String?
    @NSManaged public var eventsUrl: String?
    @NSManaged public var followersUrl: String?
    @NSManaged public var followingUrl: String?
    @NSManaged public var gistsUrl: String?
    @NSManaged public var htmlUrl: String?
    @NSManaged public var id: Int64
    @NSManaged public var login: String?
    @NSManaged public var organizationsUrl: String?
    @NSManaged public var ownerType: String?
    @NSManaged public var receivedEventsUrl: String?
    @NSManaged public var reposUrl: String?
    @NSManaged public var siteAdmin: Bool
    @NSManaged public var starredUrl: String?
    @NSManaged public var subscriptionsUrl: String?
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
