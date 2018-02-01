//
//  DataMapper.swift
//  Gnoll
//
//  Created by Jovito Royeca on 01/02/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit

class DataMapper: NSObject {
    class func coreData2Entity(repository: Repository) -> RepositoryEntity {
        
        // RepositoryEntity
        var json = [String: Any]()
        
        json["id"] = repository.id
        json["forks"] = repository.forks
        json["forks_url"] = repository.forksURL
        json["watchers"] = repository.watchers
        json["private"] = repository.private_
        if let x = repository.repositoryDescription {
            json["description"] = x
        }
        if let x = repository.name {
            json["name"] = x
        }
        
        // OwnerEntity
        if let owner = repository.owner {
            var json2 = [String: Any]()
            
            json2["id"] = owner.id
            if let x = owner.login {
                json2["login"] = x
            }
            if let x = owner.avatarURL {
                json2["avatar_url"] = x
            }
            
            json["owner"] = json2
        }
        
        // fork items
        if let forkItems = repository.forkItems {
            var array = [[String: Any]]()
            
            for repo in forkItems.allObjects {
                if let r = repo as? Repository {
                    var jsonF = [String: Any]()
                    
                    // RepositoryEntity
                    jsonF["id"] = r.id
                    jsonF["forks"] = r.forks
                    jsonF["forks_url"] = r.forksURL
                    jsonF["watchers"] = r.watchers
                    jsonF["private"] = r.private_
                    if let x = r.repositoryDescription {
                        jsonF["description"] = x
                    }
                    if let x = repository.name {
                        jsonF["name"] = x
                    }
                    
                    // OwnerEntity
                    if let owner = r.owner {
                        var json2 = [String: Any]()
                        
                        json2["id"] = owner.id
                        if let x = owner.login {
                            json2["login"] = x
                        }
                        if let x = owner.avatarURL {
                            json2["avatar_url"] = x
                        }
                        
                        jsonF["owner"] = json2
                    }
                    
                    array.append(jsonF)
                }
            }
            
            json["forkItems"] = array
        }
        
        let entity = RepositoryEntity(JSON: json)!
        return entity
    }
}
