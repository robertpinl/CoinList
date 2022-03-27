//
//  Constants.swift
//  CoinList
//
//  Created by Robert P on 23.01.2022.
//

import Foundation

struct K {
    // Top 100 coins
    static let top100Url = URL(string: "https://api.coinlore.net/api/tickers/")!
    
    // List of cryptocurrencies
    static let symbolUrl = URL(string: "https://api.exchangerate.host/cryptocurrencies")!
    
    // Rates
    static let rateUrl = URL(string: "https://api.exchangerate.host/latest?source=crypto&base=USD")!
}
