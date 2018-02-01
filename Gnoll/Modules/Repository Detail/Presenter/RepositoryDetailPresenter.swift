//
//  RepositoryDetailPresenter.swift
//  Gnoll
//
//  Created by Jovito Royeca on 01/02/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit

class RepositoryDetailPresenter: RepositoryDetailPresenterProtocol {
    weak var view: RepositoryDetailViewProtocol?
    var interactor: RepositoryDetailInteractorInputProtocol?
    var repository: RepositoryEntity?
    
    func viewDidLoad() {
        if let repository = repository {
            retrieveRepositoryDetails(withRepository: repository)
        }
    }
    
    func retrieveRepositoryDetails(withRepository repository: RepositoryEntity) {
        view?.showLoading()
        interactor?.retrieveRepositoryDetails(withRepository: repository)
    }
}

extension RepositoryDetailPresenter: RepositoryDetailInteractorOutputProtocol {
    func didRetrieveRepositoryDetails(_ repository: RepositoryEntity) {
        view?.hideLoading()
        view?.showRepository(repository)
    }
    
    func onError(_ error: Error) {
        view?.hideLoading()
        view?.showError(error)
    }
}
