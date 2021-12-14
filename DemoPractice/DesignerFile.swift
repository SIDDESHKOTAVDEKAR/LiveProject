//
//  DesignerFile.swift
//  DemoPractice
//
//  Created by Siddhesh Kotavdekar on 12/6/21.
//  Copyright © 2021 Siddhesh Kotavdekar. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class customDesign:UIImageView{
    
    @IBInspectable var cornerRadius:Int = 0{
        didSet{
            layer.cornerRadius = CGFloat(cornerRadius)
        }
    }
}

@IBDesignable
class customButton:UIButton{
    @IBInspectable var borderWidth:Int = 0{
        didSet{
            layer.borderWidth = CGFloat(borderWidth)
            
        }
    }
    
    @IBInspectable var borderColor: UIColor = .orange {
        didSet{
            layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var cornerRadius: Int = 0 {
        didSet{
            layer.cornerRadius = CGFloat(cornerRadius)
            
        }
    }
}


@IBDesignable
class customView:UIView{
    @IBInspectable var cornerRadius:Int = 0{
        didSet{
            layer.cornerRadius = CGFloat(cornerRadius)
        }
    }
    @IBInspectable var borderwidth : Int = 0{
        didSet{
            layer.borderWidth = CGFloat(borderwidth)
        }
    }
    @IBInspectable var borderColor: UIColor = .lightGray {
        didSet{
            layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var shadow: UIColor = .lightGray {
        didSet{
            layer.shadowColor = shadow.cgColor
            layer.masksToBounds = false
            layer.shadowOffset = CGSize(width: -1, height: 1)
            layer.shadowRadius = 3
            layer.shadowOpacity = 1
            
        }
    }
}
