//
//  CryptoCalculatorView.swift
//  CryptoCalculator
//
//  Created by Sikun Chen on 2025-01-27.
//

import SwiftUI

struct CryptoCalculatorView: View {
    @StateObject private var viewModel = CryptoCalculatorViewModel()
    
    var body: some View {
        Form {
            Section(header: Text("Crypto Amount")) {
                TextField("Enter amount", text: $viewModel.cryptoAmount)
                    .keyboardType(.decimalPad)
            }
            
            Section(header: Text("Select Crypto")) {
                Picker("Crypto", selection: $viewModel.selectedCrypto) {
                    ForEach(CryptoCurrency.supportedCryptos) { crypto in
                        Text(crypto.name).tag(crypto)
                    }
                }
            }
            
            Section(header: Text("Select Fiat")) {
                Picker("Fiat", selection: $viewModel.selectedFiat) {
                    ForEach(FiatCurrency.supportedFiats) { fiat in
                        Text(fiat.name).tag(fiat)
                    }
                }
            }
            
            Section {
                Button("Convert", action: viewModel.convert)
            }
            
            if viewModel.isLoading {
                ProgressView()
            }
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            
            if !viewModel.convertedAmount.isEmpty {
                Text("Converted Amount: \(viewModel.convertedAmount) \(viewModel.selectedFiat.symbol)")
                    .padding()
            }
        }
        .navigationTitle("Crypto to Fiat")
    }
}
