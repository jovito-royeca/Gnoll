//
//  RepositoryDetailRemoteDataManager.swift
//  Gnoll
//
//  Created by Jovito Royeca on 01/02/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit
import Alamofire

class RepositoryDetailRemoteDataManager: RepositoryDetailRemoteDataManagerInputProtocol {
    var remoteRequestHandler: RepositoryDetailRemoteDataManagerOutputProtocol?
    
    func retrieveRepositoryDetails(withRepository repository: RepositoryEntity) {
        if let url = repository.forksUrl {
            Alamofire.request(url, method: .get)
                .validate()
                .responseJSON { response in
                    switch response.result {
                    case .success(let json):
                        self.remoteRequestHandler?.onRepositoryDetailRetrieved(json as! [[String: Any]])
                    case .failure(let error):
                        self.remoteRequestHandler?.onError(error)
                    }
            }

        }
    }
    

}
