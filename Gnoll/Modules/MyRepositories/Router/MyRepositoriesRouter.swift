//
//  MyRepositoriesRouter.swift
//  Gnoll
//
//  Created by Jovito Royeca on 01/02/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit
import KeychainAccess
import OAuthSwift

class MyRepositoriesRouter: MyRepositoriesRouterProtocol {
    class func initModule(withView view: MyRepositoriesViewController) {
        let presenter: MyRepositoriesPresenterProtocol & MyRepositoriesInteractorOutputProtocol = MyRepositoriesPresenter()
        let interactor: MyRepositoriesInteractorInputProtocol & MyRepositoriesRemoteDataManagerOutputProtocol = MyRepositoriesInteractor()
        let localDataManager: MyRepositoriesLocalDataManagerInputProtocol = MyRepositoriesLocalDataManager()
        let remoteDataManager: MyRepositoriesRemoteDataManagerInputProtocol = MyRepositoriesRemoteDataManager()
        let router: MyRepositoriesRouterProtocol = MyRepositoriesRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDataManager = localDataManager
        interactor.remoteDataManager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
    }
    
    func presentRepositoryDetailsScreen(from view: MyRepositoriesViewProtocol, forRepository repository: RepositoryEntity) {
        let router = RepositoryDetailRouter.createModule(withRepository: repository)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(router, animated: true)
        }
    }
    
    func presentLoginScreen(from view: MyRepositoriesViewProtocol) {
        let oauthswift = OAuth2Swift(
            consumerKey:    kGitHubClientID,
            consumerSecret: kGitHubClientSecret,
            authorizeUrl:   kGitHubAuthorizeUrl,
            accessTokenUrl: kGitHubAccessTokenUrl,
            responseType:   "code"
        )
        
        if let sourceView = view as? UIViewController {
            oauthswift.authorizeURLHandler = SafariURLHandler(viewController: sourceView, oauthSwift: oauthswift)//OAuthSwiftOpenURLExternally.sharedInstance
        }
        
        let state = generateState(withLength: 20)
        let _ = oauthswift.authorize(
            withCallbackURL: URL(string: "oauth-gnoll://oauth-callback/gnoll")!, scope: "user,repo", state: state,
            success: { credential, response, parameters in
                self.setGithubAccessToken(token: credential.oauthToken)
            },
            failure: { error in
                print(error.description)
            }
        )
    }
    
    // MARK: Helper methods
    func getGithubAccessToken() -> String? {
        let keychain = Keychain(service: "com.jovitoroyeca.Gnoll")
        return keychain[kGitHubAccessToken]
    }
    
    func setGithubAccessToken(token: String) {
        let keychain = Keychain(service: "com.jovitoroyeca.Gnoll")
        keychain[kGitHubAccessToken] = token
    }
    
    func generateState(withLength len: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let length = UInt32(letters.count)
        
        var randomString = ""
        for _ in 0..<len {
            let rand = arc4random_uniform(length)
            let idx = letters.index(letters.startIndex, offsetBy: Int(rand))
            let letter = letters[idx]
            randomString += String(letter)
        }
        return randomString
    }
}


