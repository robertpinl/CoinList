//
//  CoinListViewModel.swift
//  CoinList
//
//  Created by Robert P on 23.01.2022.
//

import SwiftUI
import Combine

final class CoinListViewModel: ObservableObject {
    
    @Published var coins = [Top100Coin]()
    @Published var showDetail = Bool()
    @Published var isLoading = false
    
    let networkService = NetworkService()
    var selectedCoin: Top100Coin?
    var cancellables = Set<AnyCancellable>()
    
    func getCoins() {
        
        var currencies: AnyPublisher<Top100Coins, Error> {
            let url = URL(string: K.baseUrl)!
            return networkService.fetchData(url: url)
        }
        
        isLoading = true
        
        currencies.sink { completion in
            switch completion {
            case .finished:
                self.isLoading = false
                print("Top 100 completed")
            case .failure(let error):
                self.isLoading = false
                print("Top 100 error: \(error)")
            }
        } receiveValue: { coins in
            self.coins = coins.data
        }.store(in: &cancellables)

    }
    
    func show(_ coin: Top100Coin) {
        selectedCoin = coin
        showDetail = true
    }
    
    func isImageAvailable(_ named: String) -> Bool {
        return UIImage(named: named) != nil
    }

}
