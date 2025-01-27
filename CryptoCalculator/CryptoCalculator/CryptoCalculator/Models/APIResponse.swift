//
//  APIResponse.swift
//  CryptoCalculator
//
//  Created by Sikun Chen on 2025-01-27.
//

import Foundation

struct APIResponse: Codable {
    let data: RateData
}

struct RateData: Codable {
    let currency: String
    let rates: [String: String]
}
