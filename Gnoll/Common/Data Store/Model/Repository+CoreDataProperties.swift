//
//  Repository+CoreDataProperties.swift
//  Gnoll
//
//  Created by Jovito Royeca on 01/02/2018.
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
    @NSManaged public var archiveURL: String?
    @NSManaged public var assigneesURL: String?
    @NSManaged public var blobsURL: String?
    @NSManaged public var branchesURL: String?
    @NSManaged public var cloneURL: String?
    @NSManaged public var collaboratorsURL: String?
    @NSManaged public var commentsURL: String?
    @NSManaged public var commitsURL: String?
    @NSManaged public var compareURL: String?
    @NSManaged public var contentsURL: String?
    @NSManaged public var contributorsURL: String?
    @NSManaged public var createdAt: NSDate?
    @NSManaged public var defaultBranch: String?
    @NSManaged public var deploymentsURL: String?
    @NSManaged public var downloadsURL: String?
    @NSManaged public var eventsURL: String?
    @NSManaged public var fork: Bool
    @NSManaged public var forkCount: Int32
    @NSManaged public var forks: Int32
    @NSManaged public var forksURL: String?
    @NSManaged public var fullName: String?
    @NSManaged public var gitCommitsURL: String?
    @NSManaged public var gitRefsURL: String?
    @NSManaged public var gitTagsURL: String?
    @NSManaged public var gitURL: String?
    @NSManaged public var hasDownloads: String?
    @NSManaged public var hasIssues: Bool
    @NSManaged public var hasPages: Bool
    @NSManaged public var hasProjects: String?
    @NSManaged public var hasWiki: Bool
    @NSManaged public var homepage: String?
    @NSManaged public var hooksURL: String?
    @NSManaged public var htmlURL: String?
    @NSManaged public var id: Int64
    @NSManaged public var issueCommentURL: String?
    @NSManaged public var issueEventsURL: String?
    @NSManaged public var issuesURL: String?
    @NSManaged public var keysURL: String?
    @NSManaged public var labelsURL: String?
    @NSManaged public var language: String?
    @NSManaged public var languagesURL: String?
    @NSManaged public var mergesURL: String?
    @NSManaged public var milestonesURL: String?
    @NSManaged public var mirrorURL: String?
    @NSManaged public var name: String?
    @NSManaged public var notificationsURL: String?
    @NSManaged public var openIssues: Int32
    @NSManaged public var openIssuesCount: Int32
    @NSManaged public var pullsURL: String?
    @NSManaged public var pushedAt: NSDate?
    @NSManaged public var releasesURL: String?
    @NSManaged public var repositoryDescription: String?
    @NSManaged public var private_: Bool
    @NSManaged public var score: Double
    @NSManaged public var size: Int64
    @NSManaged public var sshURL: String?
    @NSManaged public var stargazersCount: Int32
    @NSManaged public var stargazersURL: String?
    @NSManaged public var statusesURL: String?
    @NSManaged public var subscribersURL: String?
    @NSManaged public var subscriptionURL: String?
    @NSManaged public var svnURL: String?
    @NSManaged public var tagsURL: String?
    @NSManaged public var teamsURL: String?
    @NSManaged public var treesURL: String?
    @NSManaged public var updatedAt: NSDate?
    @NSManaged public var url: String?
    @NSManaged public var watchers: Int32
    @NSManaged public var watchersCount: Int32
    @NSManaged public var repositoryQuery: RepositoryQuery?
    @NSManaged public var license: License?
    @NSManaged public var owner: Owner?
    @NSManaged public var forkItems: NSSet?

}

// MARK: Generated accessors for formItems
extension Repository {

    @objc(addForkItemsObject:)
    @NSManaged public func addToForkItems(_ value: Repository)

    @objc(removeForkItemsObject:)
    @NSManaged public func removeFromForkItems(_ value: Repository)

    @objc(addForkItems:)
    @NSManaged public func addToForkItems(_ values: NSSet)

    @objc(removeForkItems:)
    @NSManaged public func removeFromForkItems(_ values: NSSet)

}
