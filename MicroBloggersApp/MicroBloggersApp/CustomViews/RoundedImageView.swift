//
//  RoundedUIView.swift
//  MicroBloggersApp
//
//  Created by Zeynep Gizem Gürsoy on 8.04.2022.
//

import UIKit

class RoundedImageView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        let width = bounds.width < bounds.height ? bounds.width : bounds.height
        let mask = CAShapeLayer()
        mask.path = UIBezierPath(ovalIn: CGRect(x: bounds.midX - width / 2, y: bounds.midY - width / 2, width: width, height: width)).cgPath
        layer.masksToBounds = true
        mask.borderWidth = 2.0
        mask.borderColor = UIColor.blue.cgColor
        layer.mask = mask
        layer.mask?.borderWidth = 2.0
        layer.mask?.borderColor = UIColor.blue.cgColor
    }

}
