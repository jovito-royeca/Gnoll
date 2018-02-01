//
//  RepositoriesRouter.swift
//  Gnoll
//
//  Created by Jovito Royeca on 30/01/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit

class RepositoriesRouter: RepositoriesRouterProtocol {
    class func initModule(withView view: RepositoriesViewController) {
        let presenter: RepositoriesPresenterProtocol & RepositoriesInteractorOutputProtocol = RepositoriesPresenter()
        let interactor: RepositoriesInteractorInputProtocol & RepositoriesRemoteDataManagerOutputProtocol = RepositoriesInteractor()
        let localDataManager: RepositoriesLocalDataManagerInputProtocol = RepositoriesLocalDataManager()
        let remoteDataManager: RepositoriesRemoteDataManagerInputProtocol = RepositoriesRemoteDataManager()
        let router: RepositoriesRouterProtocol = RepositoriesRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDataManager = localDataManager
        interactor.remoteDataManager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
    }
    
    func presentRepositoryDetailsScreen(from view: RepositoriesViewProtocol, forRepository repository: RepositoryEntity) {
        let router = RepositoryDetailRouter.createModule(withRepository: repository)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(router, animated: true)
        }
    }
}
