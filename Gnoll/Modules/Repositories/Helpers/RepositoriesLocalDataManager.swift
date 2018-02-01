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
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        return try dataStack!.mainContext.fetch(request)
        
//        let request: NSFetchRequest<RepositoryQuery> = NSFetchRequest(entityName: "RepositoryQuery")
//        var repos = [Repository]()
//        for rq in try dataStack!.mainContext.fetch(request) {
//            repos = rq.items?.allObjects as! [Repository]
//        }
//        return repos
    }
    
    func saveRepositoryQuery(json: [String: Any]) {
        dataStack = DataStack(modelName: "Gnoll")
        
        // delete all first
        let request: NSFetchRequest<Repository> = NSFetchRequest(entityName: "Repository")
        for repo in try! dataStack!.mainContext.fetch(request) {
            dataStack!.mainContext.delete(repo)
        }
        try! dataStack!.mainContext.save()

        if let items = json["items"] as? [[String: Any]] {
            dataStack!.sync(items, inEntityNamed: "Repository") { error in
                if let error = error {
                    print("\(error)")
                }
            }
        }

        // delete all first
//        let request: NSFetchRequest<Repository> = NSFetchRequest(entityName: "RepositoryQuery")
//        for rq in try! dataStack!.mainContext.fetch(request) {
//            dataStack!.mainContext.delete(rq)
//        }
//        try! dataStack!.mainContext.save()
//
//        dataStack!.sync([json], inEntityNamed: "RepositoryQuery") { error in
//            if let error = error {
//                print("\(error)")
//            }
//        }
    }
}
