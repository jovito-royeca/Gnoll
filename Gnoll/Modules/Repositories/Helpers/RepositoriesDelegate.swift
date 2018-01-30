//
//  RepositoriesDelegate.swift
//  Gnoll
//
//  Created by Jovito Royeca on 30/01/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit

// MARK: View
protocol RepositoriesViewDelegate: class {
    var presenter: RepositoriesPresenterDelegate? { get set }
    
    // PRESENTER -> VIEW
    func showRepositories(with repositories: [RepositoryEntity])
    func showError()
    func showLoading()
    func hideLoading()
}

// MARK: Interactor
protocol RepositoriesInteractorOutputDelegate: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveRepositories(_ repositories: [RepositoryEntity])
    func onError()
}

protocol RepositoriesInteractorInputDelegate: class {
    var presenter: RepositoriesInteractorOutputDelegate? { get set }
    var datamanager: RepositoriesGitHubAPIProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveRepositories(withQuery query: String)
}

// MARK: Presenter
protocol RepositoriesPresenterDelegate: class {
    var view: RepositoriesViewDelegate? { get set }
    var interactor: RepositoriesInteractorInputDelegate? { get set }
    var router: RepositoriesRouterDelegate? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showRepositoryDetails(forRepository repository: RepositoryEntity)
}

// MARK: Router
protocol RepositoriesRouterDelegate: class {
    static func createPostListModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentRepositoryDetailsScreen(from view: RepositoriesViewDelegate, forRepository repository: RepositoryEntity)
}

// MARK: Helpers
protocol RepositoriesDataManagerProtocol: class {
    func retrieveRepositories(withQuery query: String) throws -> [Repository]
}

