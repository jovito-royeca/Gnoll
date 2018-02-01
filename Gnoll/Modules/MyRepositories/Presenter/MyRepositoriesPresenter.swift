//
//  MyRepositoriesPresenter.swift
//  Gnoll
//
//  Created by Jovito Royeca on 01/02/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit

class MyRepositoriesPresenter: MyRepositoriesPresenterProtocol {
    weak var view: MyRepositoriesViewProtocol?
    var interactor: MyRepositoriesInteractorInputProtocol?
    var router: MyRepositoriesRouterProtocol?
    
    func viewDidAppear() {
        if let router = router {
            if let accessToken = router.getGithubAccessToken() {
                retrieveRepositories(withQuery: nil)
            } else {
                router.presentLoginScreen(from: view!)
            }
        }
    }
    
    func retrieveRepositories(withQuery query: String?) {
        view?.showLoading()
        interactor?.retrieveRepositories(withQuery: query)
    }
    
    func showRepositoryDetails(forRepository repository: RepositoryEntity) {
        router?.presentRepositoryDetailsScreen(from: view!, forRepository: repository)
    }
}

extension MyRepositoriesPresenter: MyRepositoriesInteractorOutputProtocol {
    
    func didRetrieveRepositories(_ repositories: [RepositoryEntity]) {
        view?.hideLoading()
        view?.showRepositories(repositories)
    }
    
    func onError(_ error: Error) {
        view?.hideLoading()
        view?.showError(error)
    }
    
}


