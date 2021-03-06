//
//  RepositoriesPresenter.swift
//  Gnoll
//
//  Created by Jovito Royeca on 30/01/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit

class RepositoriesPresenter: RepositoriesPresenterProtocol {
    weak var view: RepositoriesViewProtocol?
    var interactor: RepositoriesInteractorInputProtocol?
    var router: RepositoriesRouterProtocol?
    
    func viewDidLoad() {
        retrieveRepositories(withQuery: "A")
    }
    
    func retrieveRepositories(withQuery query: String?) {
        view?.showLoading()
        interactor?.retrieveRepositories(withQuery: query)
    }
    
    func showRepositoryDetails(forRepository repository: RepositoryEntity) {
        router?.presentRepositoryDetailsScreen(from: view!, forRepository: repository)
    }
}

extension RepositoriesPresenter: RepositoriesInteractorOutputProtocol {
    
    func didRetrieveRepositories(_ repositories: [RepositoryEntity]) {
        view?.hideLoading()
        view?.showRepositories(repositories)
    }
    
    func onError(_ error: Error) {
        view?.hideLoading()
        view?.showError(error)
    }
    
}
