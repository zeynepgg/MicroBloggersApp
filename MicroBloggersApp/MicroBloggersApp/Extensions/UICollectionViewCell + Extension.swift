//
//  UICollectionViewCell + Extension.swift
//  MicroBloggersApp
//
//  Created by Zeynep Gizem Gürsoy on 10.04.2022.
//

import Foundation
import UIKit

extension UICollectionViewCell{
    func changeStyle(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.7
        self.layer.masksToBounds = false
        self.contentView.layer.cornerRadius = 10
        self.contentView.clipsToBounds = true
    }
}

