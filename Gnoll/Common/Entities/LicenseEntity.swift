//
//  LicenseEntity.swift
//  Gnoll
//
//  Created by Jovito Royeca on 30/01/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import Foundation
import ObjectMapper

class LicenseEntity: Mappable {
    var key: String?
    var name: String?
    var spdxId: String?
    var url: String?
    var repositories: [RepositoryEntity]?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        key <- map["key"]
        name <- map["name"]
        spdxId <- map["spdx_id"]
        url <- map["url"]
        repositories <- map["repositories"]
    }
}

