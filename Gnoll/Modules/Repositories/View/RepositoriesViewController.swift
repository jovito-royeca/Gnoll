//
//  RepositoriesViewController.swift
//  Gnoll
//
//  Created by Jovito Royeca on 30/01/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit
import MBProgressHUD

class RepositoriesViewController: UIViewController {
    // MARK: Variables
    var searchController: UISearchController?
    var presenter: RepositoriesPresenterProtocol?
    var repositories = [RepositoryEntity]()
    var message:String?
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "GitHub"
        
        searchController = UISearchController(searchResultsController: nil)
        searchController!.searchResultsUpdater = self
        searchController!.searchBar.placeholder = "Search"
        searchController!.searchBar.sizeToFit()
        searchController!.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        navigationItem.searchController = searchController
        
        tableView.estimatedRowHeight = kRepositoryTableViewCellHeight
        tableView.setNeedsLayout()
        tableView.layoutIfNeeded()
        
        presenter?.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Custom methods
    @objc func retrieveRepositories(withQuery query: String) {
        presenter?.retrieveRepositories(withQuery: query)
    }
}

// MARK: RepositoriesViewProtocol
extension RepositoriesViewController: RepositoriesViewProtocol {
    func showRepositories(_ repositories: [RepositoryEntity]) {
        self.repositories = repositories
        tableView.reloadData()
    }
    
    func showError(_ error: Error) {
        message = error.localizedDescription
        repositories = [RepositoryEntity]()
        tableView.reloadData()
    }
    
    func showLoading() {
        print("showLoading()")
        MBProgressHUD.showAdded(to: view, animated: true)
    }
    
    func hideLoading() {
        print("hideLoading()")
        MBProgressHUD.hide(for: view, animated: true)
    }
}

// MARK: UITableViewDataSource
extension RepositoriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        
        if repositories.count > 0 {
            if let c = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell", for: indexPath) as? RepositoryTableViewCell {
                let repository = repositories[indexPath.row]
                c.show(repository: repository)
                c.selectionStyle = .default
                cell = c
            }
        } else {
            if let c = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as? MessageTableViewCell {
                c.messageLabel.text = message
                c.selectionStyle = .none
                cell = c
            }
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows = repositories.count > 0 ? repositories.count : 1
        
        return rows
    }
}

// MARK: UITableViewDelegate
extension RepositoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if repositories.count > 0 {
            presenter?.showRepositoryDetails(forRepository: repositories[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height = CGFloat(0)
        
        if repositories.count == 0 {
            height = tableView.frame.size.height
        } else {
            height = UITableViewAutomaticDimension
        }
        return height
    }
}

// MARK: UISearchResultsUpdating
extension RepositoriesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(retrieveRepositories(withQuery:)), object: nil)
        self.perform(#selector(retrieveRepositories(withQuery:)), with: searchController.searchBar.text, afterDelay: 0.5)
    }
}
