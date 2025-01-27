//
//  FiatCurrency.swift
//  CryptoCalculator
//
//  Created by Sikun Chen on 2025-01-27.
//

import Foundation

struct FiatCurrency: Identifiable, Hashable {
    let id = UUID()
    let symbol: String
    let name: String
}

extension FiatCurrency {
    static let supportedFiats: [FiatCurrency] = [
        FiatCurrency(symbol: "CAD", name: "Canadian Dollar"),
        FiatCurrency(symbol: "USD", name: "US Dollar"),
        FiatCurrency(symbol: "EUR", name: "Euro")
    ]
}
