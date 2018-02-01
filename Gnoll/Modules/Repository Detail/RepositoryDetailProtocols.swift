//
//  RepositoryDetailProtocols.swift
//  Gnoll
//
//  Created by Jovito Royeca on 01/02/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit

// MARK: View
protocol RepositoryDetailViewProtocol: class {
    var presenter: RepositoryDetailPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showRepository(_ repository: RepositoryEntity)
    func showError(_ error: Error)
    func showLoading()
    func hideLoading()
}

// MARK: Interactor
protocol RepositoryDetailInteractorInputProtocol: class {
    var presenter: RepositoryDetailInteractorOutputProtocol? { get set }
    var localDataManager: RepositoryDetailLocalDataManagerInputProtocol? { get set }
    var remoteDataManager: RepositoryDetailRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveRepositoryDetails(withRepository repository: RepositoryEntity)
}

protocol RepositoryDetailInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveRepositoryDetails(_ repository: RepositoryEntity)
    func onError(_ error: Error)
}

// MARK: Presenter
protocol RepositoryDetailPresenterProtocol: class {
    var view: RepositoryDetailViewProtocol? { get set }
    var interactor: RepositoryDetailInteractorInputProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func retrieveRepositoryDetails(withRepository repository: RepositoryEntity)
}

// MARK: Router
protocol RepositoryDetailRouterProtocol: class {
    static func createRepositoryDetailModule(withRepository repository: RepositoryEntity) -> UIViewController
}

// MARK: Helpers
protocol RepositoryDetailRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: RepositoryDetailRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrieveRepositoryDetails(withRepository repository: RepositoryEntity)
}

protocol RepositoryDetailRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onRepositoryDetailRetrieved(_ json: [[String: Any]])
    func onError(_ error: Error)
}

protocol RepositoryDetailLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    func retrieveRepositoryDetail(withRepository repository: RepositoryEntity) -> Repository?
    func save(repository: RepositoryEntity, json: [[String: Any]], completion: @escaping () -> Void)
}

