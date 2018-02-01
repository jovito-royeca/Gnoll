//
//  RepositoryDetailLocalDataManager.swift
//  Gnoll
//
//  Created by Jovito Royeca on 01/02/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit
import Sync

class RepositoryDetailLocalDataManager: RepositoryDetailLocalDataManagerInputProtocol {
    func retrieveRepositoryDetail(withRepository repository: RepositoryEntity) -> Repository? {
        let dataStack = DataStack(modelName: "Gnoll")
        let request: NSFetchRequest<Repository> = NSFetchRequest(entityName: "Repository")
        
        request.predicate = NSPredicate(format: "id == %d", repository.id)
        return try! dataStack.mainContext.fetch(request).first
    }
    
    func save(repository: RepositoryEntity, json: [[String : Any]], completion: @escaping () -> Void) {
        let dataStack = DataStack(modelName: "Gnoll")
        
        dataStack.sync(json, inEntityNamed: "Repository"/*, operations: Sync.OperationOptions.insert*/) { error in
            let request: NSFetchRequest<Repository> = NSFetchRequest(entityName: "Repository")
            request.predicate = NSPredicate(format: "id == %d", repository.id)
            
            if let r = try! dataStack.mainContext.fetch(request).first {
                // delete previous forks
                // ...
                
                // add the new forks
                var arrayIDs = [Int]()
                for dict in json {
                    if let id = dict["id"] as? Int {
                        arrayIDs.append(id)
                    }
                }
                request.predicate = NSPredicate(format: "id IN %@", arrayIDs)
                for item in try! dataStack.mainContext.fetch(request) {
                    r.addToForkItems(item)
                }
                try! dataStack.mainContext.save()
            }
            
            completion()
        }
        
        
    }

}
