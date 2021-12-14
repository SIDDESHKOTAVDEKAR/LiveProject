//
//  DSModel.swift
//  DemoPractice
//
//  Created by Siddhesh Kotavdekar on 12/12/21.
//  Copyright © 2021 Siddhesh Kotavdekar. All rights reserved.
//

import Foundation
// MARK: - Welcome
struct DSModel: Codable {
    let status: Int
    let message: String
    let data: [DSModelDatum]
}

// MARK: - Datum
struct DSModelDatum: Codable {
    let ctaSectionHead1: String
    let ctaSectionHead2, ctaHeadLink: String?
    let ctaItemHead1, ctaItemHead2, imageName: String
    let imageLink: String
    let ctaItemLink: String?
    let ctaLinkID: Int
    let linkName, linkType: String
    let ctaItemWebLink: String
    let bucketID: Int
    let bucketName: String?
    let categoryID: Int
    let categoryName: String
    let filterID: Int
    let filterName: String
    let filterValueID: Int
    let filterValueName: String?
    let searchKeywords, sku: String?
}

// MARK: - Encode/decode helpers

//class string: Codable, Hashable {
//    static func == (lhs: string, rhs: string) -> Bool {
//        <#code#>
//    }
    

//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }

//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
