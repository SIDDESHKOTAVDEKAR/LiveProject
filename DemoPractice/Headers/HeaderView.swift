//
//  HeaderView.swift
//  DemoPractice
//
//  Created by Siddhesh Kotavdekar on 12/7/21.
//  Copyright © 2021 Siddhesh Kotavdekar. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class HeaderView: UIView {
        
    @IBOutlet weak var searchCategory: UISearchBar!
    @IBOutlet weak var btnCategoryBack: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var view: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }

    private func nibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true

        addSubview(view)
    }

    private func loadViewFromNib() -> UIView {
        let nib = UINib(nibName: DPConstant.shared.HeaderView, bundle: Bundle.main)
        let nibView = nib.instantiate(withOwner: self, options: nil).last as! UIView
        return nibView
    }
    
    
}
