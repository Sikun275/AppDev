//
//  CruptoToCryptoView.swift
//  CryptoCalculator
//
//  Created by Sikun Chen on 2025-01-27.
//

import SwiftUI

struct CryptoToCryptoView: View {
    @StateObject private var viewModel = CryptoToCryptoViewModel()
    
    var body: some View {
        Form {
            Section(header: Text("Source Amount")) {
                TextField("Enter amount", text: $viewModel.sourceAmount)
                    .keyboardType(.decimalPad)
            }
            
            Section(header: Text("Source Crypto")) {
                Picker("Source Crypto", selection: $viewModel.selectedSourceCrypto) {
                    ForEach(CryptoCurrency.supportedCryptos) { crypto in
                        Text(crypto.name).tag(crypto)
                    }
                }
            }
            
            Section(header: Text("Target Crypto")) {
                Picker("Target Crypto", selection: $viewModel.selectedTargetCrypto) {
                    ForEach(CryptoCurrency.supportedCryptos) { crypto in
                        Text(crypto.name).tag(crypto)
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
                Text("Converted Amount: \(viewModel.convertedAmount) \(viewModel.selectedTargetCrypto.symbol)")
                    .padding()
            }
        }
        .navigationTitle("Crypto to Crypto")
    }
}
