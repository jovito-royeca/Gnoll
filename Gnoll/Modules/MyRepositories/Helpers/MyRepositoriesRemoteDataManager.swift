//
//  MyRepositoriesRemoteDataManager.swift
//  Gnoll
//
//  Created by Jovito Royeca on 01/02/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit
import Alamofire
import KeychainAccess

class MyRepositoriesRemoteDataManager: MyRepositoriesRemoteDataManagerInputProtocol {
    let apiUrl = "https://api.github.com/user/repos"
    
    var remoteRequestHandler: MyRepositoriesRemoteDataManagerOutputProtocol?
    
    func retrieveRepositories() {
        let keychain = Keychain(service: kKeyChainService)
        if let token = keychain[kGitHubAccessToken] {
            let requestString = "\(apiUrl)?access_token=\(token)"
            
            Alamofire.request(requestString, method: .get)
                .validate()
                .responseJSON { response in
                    switch response.result {
                    case .success(let json):
                        self.remoteRequestHandler?.onRepositoriesRetrieved(json as! [[String: Any]])
                    case .failure(let error):
                        self.remoteRequestHandler?.onError(error)
                    }
            }
        }
    }
    
}

