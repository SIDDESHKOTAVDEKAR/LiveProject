//
//  ANSModel.swift
//  DemoPractice
//
//  Created by Siddhesh Kotavdekar on 12/11/21.
//  Copyright © 2021 Siddhesh Kotavdekar. All rights reserved.
//

import Foundation
// MARK: - Welcome
struct ANSModel: Codable {
    let status: Int
    let message: String
    let data: [ANSDatum]
}

// MARK: - Datum
struct ANSDatum: Codable {
    let iDs, productID, bucketID: Int
    let sku, itemName: String
    let originalMRPINR, mrp, sellingPrice: Int
    let imageName: String
    let stock: Int
    let color: String
    let totalColor: Int
    let restockDate: String
    let isRestock, isNew: Bool
    let wishlistID: Int
    let isStockNotificationApplied: Bool
    let imageLink: String

    enum CodingKeys: String, CodingKey {
        case iDs, productID, bucketID, sku, itemName
        case originalMRPINR = "originalMRP_INR"
        case mrp, sellingPrice, imageName, stock, color, totalColor, restockDate, isRestock, isNew, wishlistID, isStockNotificationApplied, imageLink
    }
}
