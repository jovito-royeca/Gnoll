//
//  RepositoriesInteractor.swift
//  Gnoll
//
//  Created by Jovito Royeca on 30/01/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit
import Sync

class RepositoriesInteractor: RepositoriesInteractorInputProtocol {
    weak var presenter: RepositoriesInteractorOutputProtocol?
    var localDataManager: RepositoriesLocalDataManagerInputProtocol?
    var remoteDataManager: RepositoriesRemoteDataManagerInputProtocol?
    var query: String?
    
    func retrieveRepositories(withQuery query: String?) {
        self.query = query
        var entities = [RepositoryEntity]()
        
        if let query = query {
            if query.count == 0 {
                presenter?.didRetrieveRepositories(entities)
            } else {
                if let repositories = localDataManager?.retrieveRepositories(withQuery: query) {
                    for repo in repositories {
                        entities.append(DataMapper.coreData2Entity(repository: repo))
                    }
                    
                    if  entities.isEmpty {
                        remoteDataManager?.retrieveRepositories(withQuery: query)
                    } else {
                        presenter?.didRetrieveRepositories(entities)
                    }
                } else {
                    remoteDataManager?.retrieveRepositories(withQuery: query)
                }
                
            }
        } else {
            presenter?.didRetrieveRepositories(entities)
        }
    }
}

extension RepositoriesInteractor: RepositoriesRemoteDataManagerOutputProtocol {
    func onRepositoriesRetrieved(_ json: [String: Any]) {
        if let query = query {
            let completion = { () -> Void  in
                var entities = [RepositoryEntity]()
                
                if let repositories = self.localDataManager?.retrieveRepositories(withQuery: query) {
                    for repo in repositories {
                        entities.append(DataMapper.coreData2Entity(repository: repo))
                    }
                    
                    self.presenter?.didRetrieveRepositories(entities)
                }
            }
            
            localDataManager?.saveRepositoryQuery(withQuery: query, json: json, completion: completion)
        }
    }
    
    func onError(_ error: Error) {
        presenter?.onError(error)
    }
    
}
