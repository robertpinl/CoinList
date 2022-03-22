//
//  NetworkService.swift
//  CoinList
//
//  Created by Robert P on 23.01.2022.
//

import Foundation
import Network

struct NetworkService {
    func fetchTop100() async throws -> Top100DataModel {
        do {
            let (data, _) = try await URLSession.shared.data(from: K.top100Url)
            let decoder = JSONDecoder()
            return try decoder.decode(Top100DataModel.self, from: data)
        } catch {
            print(error)
            throw error
        }
    }
}
