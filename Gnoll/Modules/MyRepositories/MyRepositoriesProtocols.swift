//
//  MyRepositoriesProtocols.swift
//  Gnoll
//
//  Created by Jovito Royeca on 01/02/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit

// MARK: View
protocol MyRepositoriesViewProtocol: class {
    var presenter: MyRepositoriesPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showRepositories(_ repositories: [RepositoryEntity])
    func showError(_ error: Error)
    func showLoading()
    func hideLoading()
}

// MARK: Interactor
protocol MyRepositoriesInteractorInputProtocol: class {
    var presenter: MyRepositoriesInteractorOutputProtocol? { get set }
    var localDataManager: MyRepositoriesLocalDataManagerInputProtocol? { get set }
    var remoteDataManager: MyRepositoriesRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveRepositories(withQuery query: String?)
}

protocol MyRepositoriesInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveRepositories(_ repositories: [RepositoryEntity])
    func onError(_ error: Error)
}

// MARK: Presenter
protocol MyRepositoriesPresenterProtocol: class {
    var view: MyRepositoriesViewProtocol? { get set }
    var interactor: MyRepositoriesInteractorInputProtocol? { get set }
    var router: MyRepositoriesRouterProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidAppear()
    func retrieveRepositories(withQuery query: String?)
    func showRepositoryDetails(forRepository repository: RepositoryEntity)
}

// MARK: Router
protocol MyRepositoriesRouterProtocol: class {
    static func initModule(withView view: MyRepositoriesViewController)
    // PRESENTER -> ROUTER
    func presentRepositoryDetailsScreen(from view: MyRepositoriesViewProtocol, forRepository repository: RepositoryEntity)
    func presentLoginScreen(from view: MyRepositoriesViewProtocol)
    func getGithubAccessToken() -> String?
    func setGithubAccessToken(token: String)
}

// MARK: Helpers
protocol MyRepositoriesRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: MyRepositoriesRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrieveRepositories(withQuery query: String)
}

protocol MyRepositoriesRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onRepositoriesRetrieved(_ json: [String: Any])
    func onError(_ error: Error)
}

protocol MyRepositoriesLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    func retrieveRepositories(withQuery query: String) -> [Repository]
    func saveRepositoryQuery(withQuery query: String, json: [String: Any], completion: @escaping () -> Void)
}
