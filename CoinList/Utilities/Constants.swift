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
    static let listUrl = URL(string: "https://api.exchangerate.host/cryptocurrencies")!
    
    // Rates
    static let ratesUrl = URL(string: "https://api.exchangerate.host/source=crypto?base=USD")!
}
