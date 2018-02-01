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
    var searchController: UISearchController?
    var presenter: RepositoriesPresenterProtocol?
    var repositories = [RepositoryEntity]()
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        searchController = UISearchController(searchResultsController: nil)
        searchController!.searchResultsUpdater = self
        searchController!.searchBar.placeholder = "Search"
        searchController!.searchBar.sizeToFit()
        searchController!.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        navigationItem.searchController = searchController
        
        tableView.estimatedRowHeight = kRepositoryTableViewCellHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.setNeedsLayout()
        tableView.layoutIfNeeded()
        
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
    
    @objc func retrieveRepositories(withQuery query: String) {
        presenter?.retrieveRepositories(withQuery: query)
    }
}

// MARK: UITableViewDataSource
extension RepositoriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        
        if let c = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell", for: indexPath) as? RepositoryTableViewCell {
            let repository = repositories[indexPath.row]
            c.show(repository: repository)
            cell = c
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
}

// MARK: UITableViewDelegate
extension RepositoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showRepositoryDetails(forRepository: repositories[indexPath.row])
    }
}

extension RepositoriesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(retrieveRepositories(withQuery:)), object: nil)
        self.perform(#selector(retrieveRepositories(withQuery:)), with: searchController.searchBar.text, afterDelay: 0.5)
    }
}
