//
//  Top100DataModel.swift
//  CoinList
//
//  Created by Robert P on 23.01.2022.
//

import Foundation

struct Top100Coins: Codable {
    let data: [Top100Coin]
}

struct Top100Coin: Codable, Identifiable {
    let rank: String
    let id: String
    let symbol: String
    let name: String
    let priceUsd: String
    let changePercent24Hr: String
    let volumeUsd24Hr: String
}


