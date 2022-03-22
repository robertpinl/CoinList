//
//  CoinListViewModel.swift
//  CoinList
//
//  Created by Robert P on 23.01.2022.
//

import SwiftUI

@MainActor final class CoinListViewModel: ObservableObject {
    
    @Published var coins = [Top100Coin]()
    @Published var showDetail = Bool()
    @Published var isLoading = false
    
    let networkService = NetworkService()
    var selectedCoin: Top100Coin?
    
    func getCoins() {
        self.isLoading = true
        Task {
            do {
                self.coins = try await self.networkService.fetchTop100().data
                self.isLoading = false
            } catch {
                self.isLoading = false
                print("Error: \(error)")
            }
        }
    }
    
    func show(_ coin: Top100Coin) {
        selectedCoin = coin
        showDetail = true
    }
}
