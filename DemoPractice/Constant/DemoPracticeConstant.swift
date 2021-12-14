//
//  DemoPracticeConstant.swift
//  DemoPractice
//
//  Created by Siddhesh Kotavdekar on 12/7/21.
//  Copyright © 2021 Siddhesh Kotavdekar. All rights reserved.
//

import Foundation
import UIKit

class DPConstant:NSObject {
    
    static let shared = DPConstant()
    
    let HeaderView = "HeaderView"
    let headerforapi = ["Content-Type":"application/json",
    "Cache-Control":"no-cache",
    "Authorization":"Basic a2FuaGFpOmteaiVlJHcjZUBsIXM="]
    
}

enum userDefaultsKeys: String {
    case category = "category"
}
