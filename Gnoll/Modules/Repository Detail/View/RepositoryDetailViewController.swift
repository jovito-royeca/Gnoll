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
        if let repository = repository {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
        
        if let repository = repository {
            switch indexPath.section {
            case 0:
                switch indexPath.row {
                case 0:
                    cell.textLabel?.text = repository.name
                case 1:
                    cell.textLabel?.text = repository.owner?.login
                default:
                    ()
                }
                
            case 1:
                cell.textLabel?.text = repository.owner?.login
                if let forkItems = repository.forkItems {
                    let forkItem = forkItems[indexPath.row]
                
                    if let owner = forkItem.owner {
                        if let avatarUrl = owner.avatarURL {
                            let url = URL(string: avatarUrl)
                            cell.imageView?.sd_setImage(with: url, completed: nil)
                        } else {
                            cell.imageView?.setFAIconWithName(icon: .FAUser, textColor: UIColor.lightGray)
                        }
                        cell.textLabel?.text = owner.login
                    } else {
                        cell.imageView?.setFAIconWithName(icon: .FAUser, textColor: UIColor.lightGray)
                    }
                }
                
            default:
                ()
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows = 0
        
        if let repository = self.repository {
            switch section {
            case 0:
                rows = 2
            case 1:
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
                sections = forkItems.count > 0 ? 2 : 1
            } else {
                sections = 1
            }
        }
        return sections
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var sectionTitle:String?
        
        if let repository = self.repository {
            switch section {
            case 1:
                sectionTitle = "Forks: \(repository.forks)"
            default:
                ()
            }
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
//        if repositories.count == 0 {
//            height = tableView.frame.size.height
//        } else {
//            height = UITableViewAutomaticDimension
//        }
//        return height
//    }
}

