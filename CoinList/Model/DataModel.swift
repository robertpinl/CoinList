//
//  DataModel.swift
//  CoinList
//
//  Created by Robert P on 23.01.2022.
//

import Foundation

struct DataModel: Codable {
    let data: [Coin]
}

struct Coin: Codable, Identifiable {
    let id: String
    let symbol: String
    let name: String
    let rank: Int
    let price_usd: String
    let percent_change_24h: String
}
