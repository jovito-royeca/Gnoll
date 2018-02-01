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
    func retrieveRepositories(withQuery query: String) -> [Repository] {
        let dataStack = DataStack(modelName: "Gnoll")
        let request: NSFetchRequest<RepositoryQuery> = NSFetchRequest(entityName: "RepositoryQuery")
        var repos = [Repository]()
        
//        let today = Date()
//        let calendar = NSCalendar.current
//        let components = calendar.component(.year | .month | .day | .hour | .minute | .second, from: today)
//        //create a date with these components
//        let startDate = calendar.date(from: components)
//        [components setMonth:1];
//        [components setDay:0]; //reset the other components
//        [components setYear:0]; //reset the other components
//        NSDate *endDate = [calendar dateByAddingComponents:components toDate:startDate options:0];
//        predicate = [NSPredicate predicateWithFormat:@"((date >= %@) AND (date < %@)) || (date = nil)",startDate,endDate];
        
        
        request.predicate = NSPredicate(format: "query == %@", query)
        for rq in try! dataStack.mainContext.fetch(request) {
            repos = rq.items?.allObjects as! [Repository]
        }
        repos = repos.sorted(by: { (first: Repository, second: Repository) -> Bool in
            return first.name! < second.name!
        })
        return repos
    }
    
    func saveRepositoryQuery(withQuery query: String, json: [String: Any], completion: @escaping () -> Void) {
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
    //            if let error = error {
    //                print("\(error)")
    //            }
            completion()
        }
    }
}

