//
//  Repository+CoreDataProperties.swift
//  Gnoll
//
//  Created by Jovito Royeca on 31/01/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//
//

import Foundation
import CoreData


extension Repository {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Repository> {
        return NSFetchRequest<Repository>(entityName: "Repository")
    }

    @NSManaged public var archived: Bool
    @NSManaged public var archiveUrl: String?
    @NSManaged public var assigneesUrl: String?
    @NSManaged public var blobsUrl: String?
    @NSManaged public var branchesUrl: String?
    @NSManaged public var cloneUrl: String?
    @NSManaged public var collaboratorsUrl: String?
    @NSManaged public var commentsUrl: String?
    @NSManaged public var commitsUrl: String?
    @NSManaged public var compareUrl: String?
    @NSManaged public var contentsUrl: String?
    @NSManaged public var contributorsUrl: String?
    @NSManaged public var createdAt: NSDate?
    @NSManaged public var defaultBranch: String?
    @NSManaged public var deploymentsUrl: String?
    @NSManaged public var downloadsUrl: String?
    @NSManaged public var eventsUrl: String?
    @NSManaged public var fork: Bool
    @NSManaged public var forkCount: Int32
    @NSManaged public var forks: Int32
    @NSManaged public var forksUrl: String?
    @NSManaged public var fullName: String?
    @NSManaged public var gitCommitsUrl: String?
    @NSManaged public var gitRefsUrl: String?
    @NSManaged public var gitTagsUrl: String?
    @NSManaged public var gitUrl: String?
    @NSManaged public var hasDownloads: String?
    @NSManaged public var hasIssues: Bool
    @NSManaged public var hasPages: Bool
    @NSManaged public var hasProjects: String?
    @NSManaged public var hasWiki: Bool
    @NSManaged public var homepage: String?
    @NSManaged public var hooksUrl: String?
    @NSManaged public var htmlUrl: String?
    @NSManaged public var id: Int64
    @NSManaged public var issueCommentUrl: String?
    @NSManaged public var issueEventsUrl: String?
    @NSManaged public var issuesUrl: String?
    @NSManaged public var keysUrl: String?
    @NSManaged public var labelsUrl: String?
    @NSManaged public var language: String?
    @NSManaged public var languagesUrl: String?
    @NSManaged public var mergesUrl: String?
    @NSManaged public var milestonesUrl: String?
    @NSManaged public var mirrorUrl: String?
    @NSManaged public var name: String?
    @NSManaged public var notificationsUrl: String?
    @NSManaged public var openIssues: Int32
    @NSManaged public var openIssuesCount: Int32
    @NSManaged public var pullsUrl: String?
    @NSManaged public var pushedAt: NSDate?
    @NSManaged public var releasesUrl: String?
    @NSManaged public var repositoryDescription: String?
    @NSManaged public var repositoryPrivate: Bool
    @NSManaged public var score: Double
    @NSManaged public var size: Int64
    @NSManaged public var sshUrl: String?
    @NSManaged public var stargazersCount: Int32
    @NSManaged public var stargazersUrl: String?
    @NSManaged public var statusesUrl: String?
    @NSManaged public var subscribersUrl: String?
    @NSManaged public var subscriptionUrl: String?
    @NSManaged public var svnUrl: String?
    @NSManaged public var tagsUrl: String?
    @NSManaged public var teamsUrl: String?
    @NSManaged public var treesUrl: String?
    @NSManaged public var updatedAt: NSDate?
    @NSManaged public var url: String?
    @NSManaged public var watchers: Int32
    @NSManaged public var watchersCount: Int32
    @NSManaged public var items: NSSet?
    @NSManaged public var license: License?
    @NSManaged public var owner: Owner?

}

// MARK: Generated accessors for items
extension Repository {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: RepositoryQuery)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: RepositoryQuery)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}
