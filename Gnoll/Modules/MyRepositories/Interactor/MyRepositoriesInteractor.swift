//
//  MyRepositoriesInteractor.swift
//  Gnoll
//
//  Created by Jovito Royeca on 01/02/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit
import KeychainAccess

class MyRepositoriesInteractor: MyRepositoriesInteractorInputProtocol {
    weak var presenter: MyRepositoriesInteractorOutputProtocol?
    var localDataManager: MyRepositoriesLocalDataManagerInputProtocol?
    var remoteDataManager: MyRepositoriesRemoteDataManagerInputProtocol?
    var query: String?
    
    func checkAuthentication() -> Bool {
        return true
    }
    
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

extension MyRepositoriesInteractor: MyRepositoriesRemoteDataManagerOutputProtocol {
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

