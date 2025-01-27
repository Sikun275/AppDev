//
//  CryptoCurrency.swift
//  CryptoCalculator
//
//  Created by Sikun Chen on 2025-01-27.
//

import Foundation

struct CryptoCurrency: Identifiable, Hashable {
    let id = UUID()
    let symbol: String
    let name: String
}

extension CryptoCurrency {
    static let supportedCryptos: [CryptoCurrency] = [
        CryptoCurrency(symbol: "BTC", name: "Bitcoin"),
        CryptoCurrency(symbol: "ETH", name: "Ethereum"),
        CryptoCurrency(symbol: "DOGE", name: "Doge Coin"),
        CryptoCurrency(symbol: "XRP", name: "Ripple Consensus Ledger"),
        CryptoCurrency(symbol: "LTC", name: "Litecoin"),
        CryptoCurrency(symbol: "ADA", name: "Cardano")
    ]
}
