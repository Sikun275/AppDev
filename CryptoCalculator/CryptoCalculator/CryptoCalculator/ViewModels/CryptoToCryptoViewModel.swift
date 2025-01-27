//
//  CryptoToCryptoViewModel.swift
//  CryptoCalculator
//
//  Created by Sikun Chen on 2025-01-27.
//

import Foundation
import Combine

class CryptoToCryptoViewModel: ObservableObject {
    @Published var sourceAmount: String = ""
    @Published var selectedSourceCrypto: CryptoCurrency = .supportedCryptos[0]
    @Published var selectedTargetCrypto: CryptoCurrency = .supportedCryptos[1]
    @Published var convertedAmount: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    func convert() {
        // Validate input
        guard !sourceAmount.isEmpty else {
            errorMessage = "Please enter a valid amount."
            return
        }
        
        guard let amount = Double(sourceAmount), amount > 0 else {
            errorMessage = "Invalid amount. Please enter a positive number."
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        CryptoAPIService.shared.fetchExchangeRates(for: selectedSourceCrypto.symbol)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] response in
                guard let self = self else { return }
                
                if let rateString = response.data.rates[self.selectedTargetCrypto.symbol],
                   let rate = Double(rateString) {
                    self.convertedAmount = String(format: "%.2f", amount * rate)
                } else {
                    self.errorMessage = CryptoError.rateUnavailable.localizedDescription
                }
            }
            .store(in: &cancellables)
    }
}
