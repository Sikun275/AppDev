//
//  CryptoDataManager.swift
//  MySimpleCrypto
//
//  Created by Sikun Chen on 2024-11-23.
//

import Foundation

class CryptoDataManager{
    private let plistURL : URL
    private var cryptoHolds: [CryptoHoldData] = []

    init(){
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask ).first!
        self.plistURL = documents.appendingPathComponent("CryptoHolds.plist")
        
        loadData()
    }
    
    func loadData(){
        do {
            let data = try Data(contentsOf: plistURL)
            let decoder = PropertyListDecoder()
            self.cryptoHolds = try decoder.decode([CryptoHoldData].self, from: data)
        } catch {
            print("Failed to load data: \(error)")
        }
        
    }
    
    func savaData(){
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(cryptoHolds)
            try data.write(to: plistURL)
        } catch {
            print("Failed to save data: \(error)")
        }
        
    }
    
    func setHold(for symbol: String, hold: Double){
        if let index = cryptoHolds.firstIndex(where:{ $0.symbol == symbol }){
            cryptoHolds[index].hold = hold
        }else{
            cryptoHolds.append(CryptoHoldData(symbol: symbol, hold: hold))
        }
        
        savaData()
    }
    
    
    func getHold(for symbol: String) -> Double{
        return cryptoHolds.first(where: { $0.symbol == symbol })?.hold ?? 0.0
        /*
         - ?.hold: Optional chaining
         - ?? 0.0 Nil-coalescing operator ( = else)
            this is swfit only, consider a default val in python
         */
        
    }
    
}
