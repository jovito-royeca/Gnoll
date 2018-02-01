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
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var watchersLabel: UILabel!
    
    // MARK: Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // make the image circular
        ownerAvatar.layer.cornerRadius = ownerAvatar.frame.size.height / 2
        ownerAvatar.layer.masksToBounds = true
        ownerAvatar.layer.borderWidth = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: Custom methods
    func show(repository: RepositoryEntity) {
        if let owner = repository.owner {
            if let avatarUrl = owner.avatarURL {
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
        forksLabel.setFAText(prefixText: "", icon: .FACodeFork, postfixText: " \(repository.forks)", size: 13)
        watchersLabel.setFAText(prefixText: "", icon: .FAEye, postfixText: " \(repository.watchers)", size: 13)
    }
}
