//
//  ConverterDataModel.swift
//  CoinList
//
//  Created by Robert P on 25.03.2022.
//

import Foundation

struct ConverterRateModel: Codable {
    let rates: [String: Double]
}

struct ConverterSymbolModel: Codable {
    let cryptocurrencies: [String: Cryptocurrency]
}

struct Cryptocurrency: Codable {
    let symbol: String
    let name: String
}


