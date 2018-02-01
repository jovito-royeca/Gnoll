//
//  MyRepositoriesInteractor.swift
//  Gnoll
//
//  Created by Jovito Royeca on 01/02/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit

class MyRepositoriesInteractor: MyRepositoriesInteractorInputProtocol {
    weak var presenter: MyRepositoriesInteractorOutputProtocol?
    var localDataManager: MyRepositoriesLocalDataManagerInputProtocol?
    var remoteDataManager: MyRepositoriesRemoteDataManagerInputProtocol?
    var query: String?
    
    func retrieveRepositories(withQuery query: String?) {
        self.query = query
        var entities = [RepositoryEntity]()
        
        if let repositories = localDataManager?.retrieveRepositories(withQuery: query) {
            for repo in repositories {
                entities.append(DataMapper.coreData2Entity(repository: repo))
            }
            
            if  entities.isEmpty {
                remoteDataManager?.retrieveRepositories()
            } else {
                presenter?.didRetrieveRepositories(entities)
            }
        } else {
            remoteDataManager?.retrieveRepositories()
        }
    }
}

extension MyRepositoriesInteractor: MyRepositoriesRemoteDataManagerOutputProtocol {
    func onRepositoriesRetrieved(_ json: [[String: Any]]) {
        
        let completion = { () -> Void  in
            var entities = [RepositoryEntity]()
            
            if let repositories = self.localDataManager?.retrieveRepositories(withQuery: self.query) {
                for repo in repositories {
                    entities.append(DataMapper.coreData2Entity(repository: repo))
                }
                
                self.presenter?.didRetrieveRepositories(entities)
            }
        }
        
        localDataManager?.saveRepository(json: json, completion: completion)
    }
    
    func onError(_ error: Error) {
        presenter?.onError(error)
    }
    
}

