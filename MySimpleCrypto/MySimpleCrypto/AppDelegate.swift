//
//  AppDelegate.swift
//  MySimpleCrypto
//
//  Created by Sikun Chen on 2024-11-25.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let apiKey = "YOUR_COINBASE_API_KEY" // Replace with your actual API key
        let viewController = ViewController(apiKey: apiKey, symbol: "BTC", currency: "CAD")
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
}

