//
//  RepositoryDetailViewController.swift
//  Gnoll
//
//  Created by Jovito Royeca on 01/02/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit
import MBProgressHUD
import SDWebImage

class RepositoryDetailViewController: UIViewController {
    // MARK: Variables
    var repository: RepositoryEntity?
    var presenter: RepositoryDetailPresenterProtocol?
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.estimatedRowHeight = kRepositoryTableViewCellHeight
        tableView.setNeedsLayout()
        tableView.layoutIfNeeded()
        
        if let repository = repository {
            title = repository.name
            presenter?.retrieveRepositoryDetails(withRepository: repository)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: RepositoryDetailViewProtocol
extension RepositoryDetailViewController: RepositoryDetailViewProtocol {
    func showRepository(_ repository: RepositoryEntity) {
        self.repository = repository
        tableView.reloadData()
    }
    
    func showError(_ error: Error) {
        print("showError()")
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
extension RepositoryDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        
        if let repository = repository {
            switch indexPath.section {
            case 0:
                if let c = tableView.dequeueReusableCell(withIdentifier: "RepositoryDetailCell", for: indexPath) as? RepositoryDetailTableViewCell {
                    c.show(repository: repository)
                    c.selectionStyle = .none
                    cell = c
                }
                
            case 1:
                if let owner = repository.owner,
                    let c = tableView.dequeueReusableCell(withIdentifier: "OwnerCell", for: indexPath) as? OwnerTableViewCell {
                    c.show(owner: owner)
                    c.selectionStyle = .none
                    cell = c
                }
                
            case 2:
                
                if let forkItems = repository.forkItems,
                    let c = tableView.dequeueReusableCell(withIdentifier: "OwnerCell", for: indexPath) as? OwnerTableViewCell {
                    
                    let forkItem = forkItems[indexPath.row]
                
                    if let owner = forkItem.owner {
                        c.show(owner: owner)
                    }
                    c.selectionStyle = .none
                    
                    cell = c
                }
                
            default:
                ()
            }
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows = 0
        
        if let repository = self.repository {
            switch section {
            case 0,
                 1:
                rows = 1
            case 2:
                if let forkItems = repository.forkItems {
                    rows = forkItems.count
                }
            default:
                ()
            }
        }
        return rows
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        var sections = 0
        
        if let repository = self.repository {
            if let forkItems = repository.forkItems {
                sections = forkItems.count > 0 ? 3 : 2
            } else {
                sections = 2
            }
        }
        return sections
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var sectionTitle:String?
        
        switch section {
        case 1:
            sectionTitle = "Owner"
        case 2:
            sectionTitle = "Forks"
        default:
            ()
        }
        return sectionTitle
    }
}

// MARK: UITableViewDelegate
extension RepositoryDetailViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        presenter?.showRepositoryDetails(forRepository: repositories[indexPath.row])
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        var height = CGFloat(0)
//
//        switch section {
//        case 0:
//            height =
//        case 2:
//            sectionTitle = "Forks"
//        default:
//            ()
//        }
//        return height
//    }
}

