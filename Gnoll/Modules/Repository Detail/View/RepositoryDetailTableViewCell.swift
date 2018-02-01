//
//  RepositoryDetailTableViewCell.swift
//  Gnoll
//
//  Created by Jovito Royeca on 01/02/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit

let kRepositoryDetailTableViewCellHeight = CGFloat(70)

class RepositoryDetailTableViewCell: UITableViewCell {
    // MARK: Outlets
    @IBOutlet weak var repositoryAvatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var watchersLabel: UILabel!
    
    // MARK: Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // make the image circular
        repositoryAvatar.layer.cornerRadius = repositoryAvatar.frame.size.height / 2
        repositoryAvatar.layer.masksToBounds = true
        repositoryAvatar.layer.borderWidth = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: Custom methods
    func show(repository: RepositoryEntity) {
        if repository.private_ {
            repositoryAvatar.setFAIconWithName(icon: .FALock, textColor: UIColor.black)
        } else {
            repositoryAvatar.setFAIconWithName(icon: .FAUnlock, textColor: UIColor.black)
        }
        
        nameLabel.text = repository.name
        descriptionLabel.text = repository.repositoryDescription
        forksLabel.setFAText(prefixText: "", icon: .FACodeFork, postfixText: " \(repository.forks)", size: 13)
        watchersLabel.setFAText(prefixText: "", icon: .FAEye, postfixText: " \(repository.watchers)", size: 13)
    }
}
