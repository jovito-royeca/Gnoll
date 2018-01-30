//
//  RepositoriesDataManager.swift
//  Gnoll
//
//  Created by Jovito Royeca on 30/01/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit

class RepositoriesDataManager: RepositoriesDataManagerProtocol {
    
    func retrieveRepositories(withQuery query: String) throws -> [Repository]  {
        
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        let request: NSFetchRequest<Post> = NSFetchRequest(entityName: String(describing: Post.self))
        
        return try managedOC.fetch(request)
    }
    
}
