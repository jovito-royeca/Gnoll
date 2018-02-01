//
//  MyRepositoriesLocalDataManager.swift
//  Gnoll
//
//  Created by Jovito Royeca on 01/02/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit
import Sync

class MyRepositoriesLocalDataManager: MyRepositoriesLocalDataManagerInputProtocol {
    func retrieveRepositories(withQuery query: String?) -> [Repository] {
        let dataStack = DataStack(modelName: "Gnoll")
        let request: NSFetchRequest<MyRepositoryQuery> = NSFetchRequest(entityName: "MyRepositoryQuery")
        var repos = [Repository]()
        
        for rq in try! dataStack.mainContext.fetch(request) {
            repos = rq.items?.allObjects as! [Repository]

            if let query = query {
                repos = repos.filter{ $0.name!.contains(query) }
            }
        }
        repos = repos.sorted(by: { (first: Repository, second: Repository) -> Bool in
            return first.name! < second.name!
        })
        return repos
    }
    
    func saveRepository(json: [[String: Any]], completion: @escaping () -> Void) {
        let dataStack = DataStack(modelName: "Gnoll")
        
        // delete all first
        let request: NSFetchRequest<MyRepositoryQuery> = NSFetchRequest(entityName: "MyRepositoryQuery")
        for rq in try! dataStack.mainContext.fetch(request) {
            dataStack.mainContext.delete(rq)
        }
        try! dataStack.mainContext.save()
        
        var newJson = [String: Any]()
        newJson["items"] = json
        newJson["date"] = Date()
        
        dataStack.sync([newJson], inEntityNamed: "MyRepositoryQuery") { error in
    //            if let error = error {
    //                print("\(error)")
    //            }
            completion()
        }
    }
}

