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
    
    func retrieveRepositories(withQuery query: String) {
        self.query = query
        var entities = [RepositoryEntity]()
        
        do {
            if let repositories = try localDataManager?.retrieveRepositories(withQuery: query) {
                for repo in repositories {
                    if let entity = RepositoryEntity(JSON: repo.export()) {
                        entities.append(entity)
                    }
                }
                
                if  entities.isEmpty {
                    remoteDataManager?.retrieveRepositories(withQuery: query)
                } else {
                    presenter?.didRetrieveRepositories(entities)
                }
            } else {
                remoteDataManager?.retrieveRepositories(withQuery: query)
            }
            
        } catch {
            presenter?.didRetrieveRepositories(entities)
        }
    }
}

extension RepositoriesInteractor: RepositoriesRemoteDataManagerOutputProtocol {
    func onRepositoriesRetrieved(_ json: [String: Any]) {
        localDataManager?.saveRepositoryQuery(json: json)
        
        if let query = query {
            var entities = [RepositoryEntity]()
            
            do {
                if let repositories = try localDataManager?.retrieveRepositories(withQuery: query) {
                    for repo in repositories {
                        if let entity = RepositoryEntity(JSON: repo.export()) {
                            entities.append(entity)
                        }
                    }
                    
                    presenter?.didRetrieveRepositories(entities)
                }
                
            } catch {
                presenter?.didRetrieveRepositories(entities)
            }
        }
    }
    
    func onError(_ error: Error) {
        presenter?.onError(error)
    }
    
}
