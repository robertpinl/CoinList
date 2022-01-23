//
//  NetworkService.swift
//  CoinList
//
//  Created by Robert P on 23.01.2022.
//

import Foundation

struct NetworkService {
    func fetchData() async throws -> DataModel {
        do {
            let (data, _) = try await URLSession.shared.data(from: K.url)
            let decoder = JSONDecoder()
            return try decoder.decode(DataModel.self, from: data)
        } catch {
            throw error
        }
    }
}
