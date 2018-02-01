//
//  MyRepositoriesRouter.swift
//  Gnoll
//
//  Created by Jovito Royeca on 01/02/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit

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
        
    }
}


