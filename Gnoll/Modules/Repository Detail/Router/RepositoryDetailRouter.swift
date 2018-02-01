//
//  RepositoryDetailRouter.swift
//  Gnoll
//
//  Created by Jovito Royeca on 01/02/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit

class RepositoryDetailRouter: RepositoryDetailRouterProtocol {
    class func createRepositoryDetailModule(withRepository repository: RepositoryEntity) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "RepositoryDetailViewController")
        
        if let view = viewController as? RepositoryDetailViewController {
            let presenter: RepositoryDetailPresenterProtocol & RepositoryDetailInteractorOutputProtocol = RepositoryDetailPresenter()
            let interactor: RepositoryDetailInteractorInputProtocol & RepositoryDetailRemoteDataManagerOutputProtocol = RepositoryDetailInteractor()
            let localDataManager: RepositoryDetailLocalDataManagerInputProtocol = RepositoryDetailLocalDataManager()
            let remoteDataManager: RepositoryDetailRemoteDataManagerInputProtocol = RepositoryDetailRemoteDataManager()

            view.presenter = presenter
            view.repository = repository
            presenter.view = view
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDataManager = localDataManager
            interactor.remoteDataManager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
        
    }
}
