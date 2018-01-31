//
//  RepositoriesViewController.swift
//  Gnoll
//
//  Created by Jovito Royeca on 30/01/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit

class RepositoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var presenter: RepositoriesPresenterProtocol?
    var repositories = [RepositoryEntity]()
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        presenter?.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension RepositoriesViewController: RepositoriesViewProtocol {
    func showRepositories(with repositories: [RepositoryEntity]) {
        self.repositories = repositories
        tableView.reloadData()
    }
    
    func showError(_ error: Error) {
        print("showError(): \(error.localizedDescription)")
    }
    
    func showLoading() {
        print("showLoading()")
    }
    
    func hideLoading() {
        print("hideLoading()")
    }
}

extension RepositoriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell", for: indexPath)
        let repository = repositories[indexPath.row]
        
        cell.textLabel?.text = repository.name
        cell.detailTextLabel?.text = repository.repositoryDescription
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
}

extension RepositoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showRepositoryDetails(forRepository: repositories[indexPath.row])
    }
    
}
