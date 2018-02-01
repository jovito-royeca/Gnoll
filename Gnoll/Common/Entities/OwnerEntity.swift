//
//  OwnerEntity.swift
//  Gnoll
//
//  Created by Jovito Royeca on 30/01/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import Foundation
import ObjectMapper

class OwnerEntity: Mappable {
    var avatarUrl: String?
    var eventsUrl: String?
    var followersUrl: String?
    var followingUrl: String?
    var gistsUrl: String?
    var htmlUrl: String?
    var id: Int64 = 0
    var login: String?
    var organizationsUrl: String?
    var receivedEventsUrl: String?
    var reposUrl: String?
    var siteAdmin = false
    var starredUrl: String?
    var subscriptionsUrl: String?
    var ownerType: String?
    var url: String?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        avatarUrl <- map["avatar_url"]
        eventsUrl <- map["events_url"]
        followersUrl <- map["followers_url"]
        followingUrl <- map["following_url"]
        gistsUrl <- map["gists_url"]
        htmlUrl <- map["html_url"]
        id <- map["id"]
        login <- map["login"]
        organizationsUrl <- map["organizations_url"]
        receivedEventsUrl <- map["received_events_url"]
        reposUrl <- map["repos_url"]
        siteAdmin <- map["site_admin"]
        starredUrl <- map["starred_url"]
        subscriptionsUrl <- map["subscriptions_url"]
        ownerType <- map["type"]
        url <- map["url"]
    }
}
