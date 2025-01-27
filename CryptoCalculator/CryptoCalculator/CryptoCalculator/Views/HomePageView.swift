//
//  HomePageView.swift
//  CryptoCalculator
//
//  Created by Sikun Chen on 2025-01-27.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink("Crypto to Fiat", destination: CryptoCalculatorView())
                NavigationLink("Crypto to Crypto", destination: CryptoToCryptoView())
            }
            .navigationTitle("Crypto Calculator")
        }
    }
}
