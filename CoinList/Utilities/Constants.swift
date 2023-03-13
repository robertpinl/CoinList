//
//  Constants.swift
//  CoinList
//
//  Created by Robert P on 23.01.2022.
//

import Foundation

struct K {
    
    static var apiKey: String {
        guard let filePath = Bundle.main.path(forResource: "ApiKey", ofType: "plist") else {
            fatalError("Couldn't find file ApiKey.plist'.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "ApiKey") as? String else {
            fatalError("Couldn't find key 'ApiKey' in 'ApiKey.plist'.")
        }
        return value
    }
    
    static var baseUrl = "https://api.coincap.io/v2/assets"
}
