//
//  CategoryModel.swift
//  DemoPractice
//
//  Created by Siddhesh Kotavdekar on 12/11/21.
//  Copyright © 2021 Siddhesh Kotavdekar. All rights reserved.
//

import Foundation
//
struct CategoryModel: Codable {
    let status: Int
    let message: String
    let data: [CMDatum]
}

// MARK: - Datum
struct CMDatum: Codable {
    let categoryID: Int
    let categoryName, categoryImage: String
    let imageLink: String
}
