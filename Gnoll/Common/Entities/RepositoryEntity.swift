//
//  RepositoryEntity.swift
//  Gnoll
//
//  Created by Jovito Royeca on 30/01/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import Foundation
import ObjectMapper

class RepositoryEntity: Mappable {
    var archived = false
    var archiveUrl: String?
    var assigneesUrl: String?
    var blobsUrl: String?
    var branchesUrl: String?
    var cloneUrl: String?
    var collaboratorsUrl: String?
    var commentsUrl: String?
    var commitsUrl: String?
    var compareUrl: String?
    var contentsUrl: String?
    var contributorsUrl: String?
    var createdAt: NSDate?
    var defaultBranch: String?
    var deploymentsUrl: String?
    var downloadsUrl: String?
    var eventsUrl: String?
    var fork = false
    var forkCount = 0
    var forks = 0
    var forksUrl: String?
    var fullName: String?
    var gitCommitsUrl: String?
    var gitRefsUrl: String?
    var gitTagsUrl: String?
    var gitUrl: String?
    var hasDownloads: String?
    var hasIssues = false
    var hasPages = false
    var hasProjects: String?
    var hasWiki = false
    var homepage: String?
    var hooksUrl: String?
    var htmlUrl: String?
    var id = 0
    var issueCommentUrl: String?
    var issueEventsUrl: String?
    var issuesUrl: String?
    var keysUrl: String?
    var labelsUrl: String?
    var language: String?
    var languagesUrl: String?
    var mergesUrl: String?
    var milestonesUrl: String?
    var mirrorUrl: String?
    var name: String?
    var notificationsUrl: String?
    var openIssues = 0
    var openIssuesCount = 0
    var repositoryDescription: String?
    var repositoryPrivate = false
    var pullsUrl: String?
    var pushedAt: NSDate?
    var releasesUrl: String?
    var score = Double(0)
    var size = 0
    var sshUrl: String?
    var stargazersCount = 0
    var stargazersUrl: String?
    var statusesUrl: String?
    var subscribersUrl: String?
    var subscriptionUrl: String?
    var svnUrl: String?
    var tagsUrl: String?
    var teamsUrl: String?
    var treesUrl: String?
    var updatedAt: NSDate?
    var url: String?
    var watchers = 0
    var watchersCount = 0
    var license: LicenseEntity?
    var owner: OwnerEntity?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        archived <- map["archived"]
        archiveUrl <- map["archive_url"]
        assigneesUrl <- map["assignees_url"]
        blobsUrl <- map["blobs_url"]
        branchesUrl <- map["branches_url"]
        cloneUrl <- map["clone_url"]
        collaboratorsUrl <- map["collaborators_url"]
        commentsUrl <- map["comments_url"]
        commitsUrl <- map["commits_url"]
        compareUrl <- map["compare_url"]
        contentsUrl <- map["contents_url"]
        contributorsUrl <- map["contributors_url"]
        createdAt <- map["created_at"]
        defaultBranch <- map["default_branch"]
        deploymentsUrl <- map["deployments_url"]
        downloadsUrl <- map["downloads_url"]
        eventsUrl <- map["events_url"]
        fork <- map["fork"]
        forkCount <- map["fork_count"]
        forks <- map["forks"]
        forksUrl <- map["forks_url"]
        fullName <- map["full_name"]
        gitCommitsUrl <- map["git_commits_url"]
        gitRefsUrl <- map["git_refs_url"]
        gitTagsUrl <- map["git_tags_url"]
        gitUrl <- map["git_url"]
        hasDownloads <- map["has_downloads"]
        hasIssues <- map["has_issues"]
        hasPages <- map["has_pages"]
        hasProjects <- map["has_projects"]
        hasWiki <- map["has_wiki"]
        homepage <- map["homepage"]
        hooksUrl <- map["hooks_url"]
        htmlUrl <- map["html_url"]
        id <- map["id"]
        issueCommentUrl <- map["issue_comment_url"]
        issueEventsUrl <- map["issue_events_url"]
        issuesUrl <- map["issues_url"]
        keysUrl <- map["keys_url"]
        labelsUrl <- map["labels_url"]
        language <- map["language"]
        languagesUrl <- map["languages_url"]
        mergesUrl <- map["merges_url"]
        milestonesUrl <- map["milestones_url"]
        mirrorUrl <- map["mirror_url"]
        name <- map["name"]
        notificationsUrl <- map["notifications_url"]
        openIssues <- map["open_issues"]
        openIssuesCount <- map["open_issues_count"]
        repositoryDescription <- map["description"]
        repositoryPrivate <- map["private"]
        pullsUrl <- map["pulls_url"]
        pushedAt <- map["pushed_at"]
        releasesUrl <- map["releases_url"]
        score <- map["score"]
        size <- map["size"]
        sshUrl <- map["ssh_url"]
        stargazersCount <- map["stargazers_count"]
        stargazersUrl <- map["stargazers_url"]
        statusesUrl <- map["statuses_url"]
        subscribersUrl <- map["subscribers_url"]
        subscriptionUrl <- map["subscription_url"]
        svnUrl <- map["svn_url"]
        tagsUrl <- map["tags_url"]
        teamsUrl <- map["teams_url"]
        treesUrl <- map["trees_url"]
        updatedAt <- map["updated_at"]
        url <- map["url"]
        watchers <- map["watchers"]
        watchersCount <- map["watchers_count"]
        license <- map["license"]
        owner <- map["owner"]
    }
}
