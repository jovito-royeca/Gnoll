//
//  RepositoriesRemoteDataManager.swift
//  Gnoll
//
//  Created by Jovito Royeca on 30/01/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit
import Alamofire

class RepositoriesRemoteDataManager: RepositoriesRemoteDataManagerInputProtocol {
    let apiUrl = "https://api.github.com/search/repositories?q="
    
    var remoteRequestHandler: RepositoriesRemoteDataManagerOutputProtocol?
    
    func retrieveRepositories(withQuery query: String) {
        let requestString = "\(apiUrl)\(query)"
        
        Alamofire.request(requestString, method: .get)
                 .validate()
                 .responseJSON { response in
                    switch response.result {
                    case .success(let json):
                        self.remoteRequestHandler?.onRepositoriesRetrieved(json as! [String: Any])
                    case .failure(let error):
                        self.remoteRequestHandler?.onError(error)
                    }
                 }
    }
    
}
