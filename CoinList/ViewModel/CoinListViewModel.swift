//
//  CoinListViewModel.swift
//  CoinList
//
//  Created by Robert P on 23.01.2022.
//

import Foundation

final class CoinListViewModel: ObservableObject {
    
    @Published var coins = [Coin]()
    
    let networkService = NetworkService()
    
    func getCoins() {
        DispatchQueue.main.async {
            Task {
                do {
                    self.coins = try await self.networkService.fetchData().data
                } catch {
                    print(error)
                }
            }
        }
    }
}
