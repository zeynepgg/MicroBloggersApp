//
//  PostCell.swift
//  MicroBloggersApp
//
//  Created by Zeynep Gizem Gürsoy on 6.04.2022.
//

import UIKit
import MicroBloggersAppAPI

class PostCell: UICollectionViewCell {

    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(post: Post,user: User){
        nameLabel.text = user.name
        userNameLabel.text = user.username
        postTitleLabel.text = post.title
        changeStyle()
 
    }
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
            
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
            
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
            
        layoutAttributes.frame = frame
            
        return layoutAttributes
    }
}
