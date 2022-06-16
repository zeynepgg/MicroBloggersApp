//
//  UIView + Extension.swift
//  MicroBloggersApp
//
//  Created by Zeynep Gizem Gürsoy on 8.04.2022.
//

import Foundation
import UIKit

extension UIView{
    func round() {
        let width = bounds.width < bounds.height ? bounds.width : bounds.height
        let mask = CAShapeLayer()
        mask.path = UIBezierPath(ovalIn: CGRect(x: bounds.midX - width / 2, y: bounds.midY - width / 2, width: width, height: width)).cgPath
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.mask = mask
    }
   @IBInspectable var cornerRadius: CGFloat {
       get{return self.cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
    }
    @IBInspectable var shadowColor: UIColor?{
            set {
                guard let uiColor = newValue else { return }
                layer.shadowColor = uiColor.cgColor
            }
            get{
                guard let color = layer.shadowColor else { return nil }
                return UIColor(cgColor: color)
            }
        }

        @IBInspectable var shadowOpacity: Float{
            set {
                layer.shadowOpacity = newValue
            }
            get{
                return layer.shadowOpacity
            }
        }

        @IBInspectable var shadowOffset: CGSize{
            set {
                layer.shadowOffset = newValue
            }
            get{
                return layer.shadowOffset
            }
        }

        @IBInspectable var shadowRadius: CGFloat{
            set {
                layer.shadowRadius = newValue
            }
            get{
                return layer.shadowRadius
            }
        }
    

}
