//
//  RepositoriesPresenter.swift
//  Gnoll
//
//  Created by Jovito Royeca on 30/01/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit

class RepositoriesPresenter: RepositoriesPresenterDelegate {
    weak var view: RepositoriesViewDelegate?
    var interactor: RepositoriesInteractorInputDelegate?
    var router: RepositoriesRouterDelegate?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrievePostList()
    }
    
    func showRepositoryDetails(forRepository repository: RepositoryEntity) {
        router?.presentRepositoryDetailsScreen(from: view!, forRepository: repository)
    }
    
}

extension RepositoriesPresenter: RepositoriesInteractorOutputDelegate {
    
    func didRetrieveRepositories(_ repositories: [RepositoryEntity]) {
        view?.hideLoading()
        view?.showRepositories(with: repositories)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
    
}
