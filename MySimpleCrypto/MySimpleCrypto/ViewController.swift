//
//  ViewController.swift
//  MySimpleCrypto
//
//  Created by Sikun Chen on 2024-11-25.
//

import UIKit

class ViewController: UIViewController {
    private let cryptoTracker: CryptoTracker
    private let symbol: String
    private let currency: String
    
    private var currentPriceLabel: UILabel!
    private var currentHoldLabel: UILabel!
    private var currentValueLabel: UILabel!
    
    init(apiKey: String, symbol: String, currency: String) {
        self.cryptoTracker = CryptoTracker(apiKey: apiKey)
        self.symbol = symbol
        self.currency = currency
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchAndDisplayData()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        currentPriceLabel = createLabel()
        currentHoldLabel = createLabel()
        currentValueLabel = createLabel()
        
        stackView.addArrangedSubview(currentPriceLabel)
        stackView.addArrangedSubview(currentHoldLabel)
        stackView.addArrangedSubview(currentValueLabel)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func createLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }
    
    private func fetchAndDisplayData() {
        cryptoTracker.fetchCurrentPrice(for: symbol, currency: currency) { [weak self] price, error in
            guard let self = self else { return }
            if let price = price {
                DispatchQueue.main.async {
                    self.currentPriceLabel.text = "Current Price of \(self.symbol) in \(self.currency): \(price)"
                    self.currentHoldLabel.text = "Current Hold: \(self.cryptoTracker.getHold(for: self.symbol))"
                    
                    self.cryptoTracker.calculateValue(for: self.symbol, currency: self.currency) { value, error in
                        if let value = value {
                            DispatchQueue.main.async {
                                self.currentValueLabel.text = "Current Value: \(value)"
                            }
                        } else {
                            DispatchQueue.main.async {
                                self.currentValueLabel.text = "Error calculating value"
                            }
                        }
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self.currentPriceLabel.text = "Error fetching price"
                }
            }
        }
    }
}
