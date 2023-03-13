//
//  ConverterViewModel.swift
//  CoinList
//
//  Created by Robert P on 26.03.2022.
//

import Foundation
import Combine

final class ConverterViewModel: ObservableObject {
    
    @Published var currencies = [ConverterCoinModel]()
    
    @Published var firstCoin: ConverterCoinModel?
    @Published var secondCoin: ConverterCoinModel?
    
    let networkService = NetworkService()
    var cancellables = Set<AnyCancellable>()
    
}

extension ConverterViewModel {
//    func getConverterCurrency() {
//                
//        var rates: AnyPublisher<ConverterRateModel, Error> {
//            return networkService.fetchData(url: K.rateUrl)
//        }
//
//        var symbols: AnyPublisher<ConverterSymbolModel, Error> {
//            return networkService.fetchData(url: K.symbolUrl)
//        }
//
//        rates.combineLatest(symbols)
//            .sink { completion in
//                switch completion {
//                case .finished:
//                    print("Converter rates succesfully finished")
//                case .failure(let error):
//                    print("Converter rates error: \(error)")
//                }
//            } receiveValue: { rates, symbols in
//                                
//                for (symbol) in rates.rates {
//
//                    let newCoin = ConverterCoinModel(title: nil, symbol: symbol.key, rate: symbol.value)
//                    self.currencies.append(newCoin)
//                }
//                
//                for title in symbols.cryptocurrencies.values {
//                                        
//                    if let index = self.currencies.firstIndex(where: { $0.symbol == title.symbol }) {
//                        self.currencies[index].title = title.name.description
//                    }
//                }
//                
//                self.currencies.sort(by: { $0.symbol < $1.symbol })
//            }.store(in: &cancellables)
//    }
}
