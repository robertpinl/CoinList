//
//  Top100DataModel.swift
//  CoinList
//
//  Created by Robert P on 23.01.2022.
//

import Foundation

struct Top100DataModel: Codable {
    let data: [Top100Coin]
}

struct Top100Coin: Codable, Identifiable {
    let id: String
    let symbol: String
    let name: String
    let rank: Int
    let price_usd: String
    let percent_change_24h: String
    let market_cap_usd: String
}


