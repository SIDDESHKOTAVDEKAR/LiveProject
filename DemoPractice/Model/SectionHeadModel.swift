//
//  SectionHeadModel.swift
//  apicallKanhai
//
//  Created by Siddhesh Kotavdekar on 12/9/21.
//  Copyright © 2021 Siddhesh Kotavdekar. All rights reserved.
//

import Foundation
import UIKit
//MARK: - Welcome

struct SectionHeadModel: Codable {
    let status: Int
    let message: String
    let data: [SectionHeadModelDatum]
}

// MARK: - Datum
struct SectionHeadModelDatum: Codable {
    let id: Int
    let type, heading1: String
    let heading2: String?
    let webLink: String
}
