//
//  TopChartsModel.swift
//  apicallKanhai
//
//  Created by Siddhesh Kotavdekar on 12/9/21.
//  Copyright © 2021 Siddhesh Kotavdekar. All rights reserved.
//

// MARK: - Welcome
struct TopChartsModel: Codable {
    let status: Int
    let message: String
    let data: [TCDatum]
}

// MARK: - Datum
struct TCDatum: Codable {
    let ctaSectionHead1: String
    let ctaSectionHead2, ctaHeadLink: JSONNull?
    let ctaItemHead1, ctaItemHead2, imageName: String
    let imageLink: String
    let ctaItemLink: JSONNull?
    let ctaLinkID: Int
    let linkName, linkType: String
    let ctaItemWebLink: String
    let bucketID: Int
    let bucketName: String?
    let categoryID: Int
    let categoryName: String?
    let filterID: Int
    let filterName: String?
    let filterValueID: Int
    let filterValueName, searchKeywords, sku: JSONNull?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
