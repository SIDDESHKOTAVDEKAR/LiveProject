//
//  Card.swift
//  DemoPractice
//
//  Created by Apple on 13/12/21.
//  Copyright © 2021 Siddhesh Kotavdekar. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CardView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = false
        }
    }
  
    @IBInspectable var shadowColors : UIColor{
           get{
               return UIColor.init(cgColor: layer.shadowColor!)
           }
           set {
               layer.shadowColor = newValue.cgColor
           }
       }
    
    @IBInspectable var borderColors : UIColor{
        get{
            return UIColor.init(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
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
    
    @IBInspectable
         var BottomRightLeftCornerRadius: CGFloat {
             set {
                 layer.cornerRadius = newValue
                 layer.masksToBounds = true
                layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
             }
             get {
                 return layer.cornerRadius
             }
         }
    
    @IBInspectable
         var TopLeftCornerRadius: CGFloat {
             set {
                 layer.cornerRadius = newValue
                 layer.masksToBounds = true
                 layer.maskedCorners = [.layerMinXMinYCorner]
             }
             get {
                 return layer.cornerRadius
             }
         }
}

