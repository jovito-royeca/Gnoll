//
//  RepositoryDetailInteractor.swift
//  Gnoll
//
//  Created by Jovito Royeca on 01/02/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit

class RepositoryDetailInteractor: RepositoryDetailInteractorInputProtocol {
    weak var presenter: RepositoryDetailInteractorOutputProtocol?
    var localDataManager: RepositoryDetailLocalDataManagerInputProtocol?
    var remoteDataManager: RepositoryDetailRemoteDataManagerInputProtocol?
    var repository: RepositoryEntity?
    
    func retrieveRepositoryDetails(withRepository repository: RepositoryEntity) {
        self.repository = repository
        if repository.forks > 0 {
            remoteDataManager?.retrieveRepositoryDetails(withRepository: repository)
        } else {
            presenter?.didRetrieveRepositoryDetails(repository)
        }
    }
}

extension RepositoryDetailInteractor: RepositoryDetailRemoteDataManagerOutputProtocol {
    func onRepositoryDetailRetrieved(_ json: [[String: Any]]) {
        if let repository = repository {
            let completion = { () -> Void  in
                if let repo = self.localDataManager?.retrieveRepositoryDetail(withRepository: repository) {
                    self.presenter?.didRetrieveRepositoryDetails(DataMapper.coreData2Entity(repository: repo))
                }
            }
            
            localDataManager?.save(repository: repository, json: json, completion: completion)
        }
    }
    
    func onError(_ error: Error) {
        presenter?.onError(error)
    }
    
}

