//
//  CustomImgView.swift
//  DemoPractice
//
//  Created by Apple on 13/12/21.
//  Copyright © 2021 Siddhesh Kotavdekar. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomImgView: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.shadowRadius = newValue
            layer.masksToBounds = false
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
            layer.shadowColor = UIColor.gray.cgColor
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
            layer.shadowColor = UIColor.black.cgColor
            layer.masksToBounds = false
        }
    }
    
    @IBInspectable var borderColor: CGColor {
        get {
            return layer.borderColor ?? UIColor.gray.cgColor
        }
        set {
            layer.borderColor = newValue
           
            layer.masksToBounds = false
        }
    }
    
    @IBInspectable var borderWidth: Float {
        get {
            return Float(layer.borderWidth)
        }
        set {
            layer.borderWidth = CGFloat(newValue)
            
            layer.masksToBounds = false
        }
    }
    
    @IBInspectable
      var TopRightLeftCornerRadius: CGFloat {
          set {
              layer.cornerRadius = newValue
              layer.masksToBounds = true
              layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
          }
          get {
              return layer.cornerRadius
          }
      }
}
