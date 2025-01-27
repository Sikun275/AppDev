//
//  CryptoAPIService.swift
//  CryptoCalculator
//
//  Created by Sikun Chen on 2025-01-27.
//

import Foundation
import Combine

class CryptoAPIService {
    static let shared = CryptoAPIService()
    private let baseURL = "https://api.coinbase.com/v2/exchange-rates"
    
    func fetchExchangeRates(for crypto: String) -> AnyPublisher<APIResponse, Error> {
        let urlString = "\(baseURL)?currency=\(crypto)"
        guard let url = URL(string: urlString) else {
            return Fail(error: CryptoError.invalidURL).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError { error -> Error in
                return CryptoError.networkError(error.localizedDescription)
            }
            .map(\.data)
            .decode(type: APIResponse.self, decoder: JSONDecoder())
            .mapError { error -> Error in
                return CryptoError.decodingError(error.localizedDescription)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

enum CryptoError: Error, LocalizedError {
    case invalidURL
    case networkError(String)
    case decodingError(String)
    case invalidResponse
    case rateUnavailable
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL. Please try again."
        case .networkError(let message):
            return "Network error: \(message)"
        case .decodingError(let message):
            return "Failed to decode response: \(message)"
        case .invalidResponse:
            return "Invalid response from the server."
        case .rateUnavailable:
            return "Exchange rate not available for the selected currency."
        }
    }
}
