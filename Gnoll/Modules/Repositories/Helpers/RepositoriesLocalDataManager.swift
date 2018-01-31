//
//  LocalRepositoriesDataManager.swift
//  Gnoll
//
//  Created by Jovito Royeca on 30/01/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit
import Sync

class RepositoriesLocalDataManager: RepositoriesLocalDataManagerInputProtocol {
    var dataStack: DataStack?
    
    func retrieveRepositories(withQuery query: String) throws -> [Repository] {
        dataStack = DataStack(modelName: "Gnoll")
        let request: NSFetchRequest<Repository> = NSFetchRequest(entityName: "Repository")
        
        return try dataStack!.mainContext.fetch(request)
    }
    
    func saveRepositoryQuery(json: [String: Any]) {
        dataStack = DataStack(modelName: "Gnoll")
        
        if let items = json["items"] as? [[String: Any]] {
            dataStack!.sync(items, inEntityNamed: "Repository") { error in
                if let error = error {
                    print("\(error)")
                }
            }
        }
    }
}
