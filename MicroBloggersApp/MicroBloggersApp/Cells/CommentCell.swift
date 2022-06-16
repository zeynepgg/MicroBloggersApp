//
//  CommentCell.swift
//  MicroBloggersApp
//
//  Created by Zeynep Gizem Gürsoy on 6.04.2022.
//

import UIKit
import MicroBloggersAppAPI

class CommentCell: UICollectionViewCell {

    @IBOutlet weak var commentMailLabel: UILabel!
    @IBOutlet weak var commentBodyLabel: UILabel!
    @IBOutlet weak var commentNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(comment: Comment){
        commentBodyLabel.text = comment.body
        commentMailLabel.text = comment.email
        commentNameLabel.text = comment.name
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
