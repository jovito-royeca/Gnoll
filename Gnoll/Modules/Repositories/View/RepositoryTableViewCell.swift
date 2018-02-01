//
//  RepositoryTableViewCell.swift
//  Gnoll
//
//  Created by Jovito Royeca on 01/02/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit
import SDWebImage
import Font_Awesome_Swift

let kRepositoryTableViewCellHeight = CGFloat(70)

class RepositoryTableViewCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet weak var ownerAvatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var watchersLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    
    // MARK: Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: Custom methods
    func show(repository: RepositoryEntity) {
        if let owner = repository.owner {
            if let avatarUrl = owner.avatarUrl {
                let url = URL(string: avatarUrl)
                ownerAvatar.sd_setImage(with: url, completed: nil)
            } else {
                ownerAvatar.setFAIconWithName(icon: .FAUser, textColor: UIColor.lightGray)
            }
        } else {
            ownerAvatar.setFAIconWithName(icon: .FAUser, textColor: UIColor.lightGray)
        }
        
        nameLabel.text = repository.name
        descriptionLabel.text = repository.repositoryDescription
        watchersLabel.setFAText(prefixText: "", icon: .FAEye, postfixText: " \(repository.watchers)", size: 13)
        forksLabel.setFAText(prefixText: "", icon: .FACodeFork, postfixText: " \(repository.forks)", size: 13)
    }
}
