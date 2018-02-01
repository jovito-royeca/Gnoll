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
    var spdxID: String?
    var url: String?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        key <- map["key"]
        name <- map["name"]
        spdxID <- map["spdx_id"]
        url <- map["url"]
    }
}

