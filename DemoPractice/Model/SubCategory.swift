//
//  SubCategory.swift
//  DemoPractice
//
//  Created by Apple on 13/12/21.
//  Copyright © 2021 Siddhesh Kotavdekar. All rights reserved.
//

import Foundation

struct SubCategoryModel: Codable {
    let status: Int
    let message: String
    let data: [SubCategoryData]
}

// MARK: - Datum
struct SubCategoryData: Codable {
    let filterID: Int
    let filterName: String
    let filterImage: FilterImage?
    let imageLink: String?
}

enum FilterImage: String, Codable {
    case empty = ""
    case the143D7E0F683C49C69D7B8B51Df9D0Ea4GIF = "143d7e0f-683c-49c6-9d7b-8b51df9d0ea4.gif"
    case the511A433044DD4Af49589F9E726E3Eb3FJpg = "511a4330-44dd-4af4-9589-f9e726e3eb3f.jpg"
}
