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
    func retrieveRepositories(withQuery query: String) throws -> [Repository] {
        let dataStack = DataStack(modelName: "Gnoll")
        
        let request: NSFetchRequest<RepositoryQuery> = NSFetchRequest(entityName: "RepositoryQuery")
        request.predicate = NSPredicate(format: "query == %@", query)
        var repos = [Repository]()
        for rq in try dataStack.mainContext.fetch(request) {
            repos = rq.items?.allObjects as! [Repository]
        }
        repos = repos.sorted(by: { (first: Repository, second: Repository) -> Bool in
            return first.name! < second.name!
        })
        return repos
    }
    
    func saveRepositoryQuery(withQuery query: String, json: [String: Any]) {
        let dataStack = DataStack(modelName: "Gnoll")
        
        // delete all first
        let request: NSFetchRequest<RepositoryQuery> = NSFetchRequest(entityName: "RepositoryQuery")
        for rq in try! dataStack.mainContext.fetch(request) {
            dataStack.mainContext.delete(rq)
        }
        try! dataStack.mainContext.save()

        var newJson = [String: Any]()
        for (k,v) in json {
            newJson[k] = v
        }
        newJson["query"] = query
        newJson["date"] = Date()
        
        dataStack.sync([newJson], inEntityNamed: "RepositoryQuery") { error in
            if let error = error {
                print("\(error)")
            }
        }
    }
}
