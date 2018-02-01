//
//  OwnerTableViewCell.swift
//  Gnoll
//
//  Created by Jovito Royeca on 01/02/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit
import SDWebImage

class OwnerTableViewCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet weak var ownerAvatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
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
    func show(owner: OwnerEntity) {
        if let avatarUrl = owner.avatarURL {
            let url = URL(string: avatarUrl)
            let placeHolder = UIImage(bgIcon: .FAUser, topIcon: .FAAlignCenter)
            ownerAvatar.sd_setImage(with: url, placeholderImage: placeHolder, options: SDWebImageOptions.lowPriority, completed: nil)
        } else {
            ownerAvatar.setFAIconWithName(icon: .FAUser, textColor: UIColor.lightGray)
        }
        
        nameLabel.text = owner.login
    }
}
