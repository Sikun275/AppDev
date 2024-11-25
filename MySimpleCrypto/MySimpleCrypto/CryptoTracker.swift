//
//  CryptoTracker.swift
//  MySimpleCrypto
//
//  Created by Sikun Chen on 2024-11-25.
//

import Foundation

class CryptoTracker {
    private let coinbaseAPIKey: String
    private let dataManager: CryptoDataManager
    
    init(apiKey: String) {
        self.coinbaseAPIKey = apiKey
        self.dataManager = CryptoDataManager()
    }
    
    func fetchCurrentPrice(for symbol: String, currency: String, completion: @escaping (Double?, Error?) -> Void) {
        let coinbaseAPIURL = "https://api.coinbase.com/v2/prices/\(symbol)-\(currency)/spot"
        
        guard let url = URL(string: coinbaseAPIURL) else {
            completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(coinbaseAPIKey)", forHTTPHeaderField: "Authorization")
        request.timeoutInterval = 10 // 10 seconds timeout
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error)
            } else if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let dataDict = json["data"] as? [String: Any],
                       let amount = dataDict["amount"] as? String {
                        completion(Double(amount), nil)
                    } else {
                        completion(nil, NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: "Failed to parse JSON"]))
                    }
                } catch {
                    completion(nil, error)
                }
            }
        }.resume()
    }
    
    func updateHold(for symbol: String, hold: Double) {
        dataManager.setHold(for: symbol, hold: hold)
    }
    
    func getHold(for symbol: String) -> Double {
        return dataManager.getHold(for: symbol)
    }
    
    func calculateValue(for symbol: String, currency: String, completion: @escaping (Double?, Error?) -> Void) {
        fetchCurrentPrice(for: symbol, currency: currency) { price, error in
            if let price = price {
                let hold = self.getHold(for: symbol)
                completion(price * hold, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
