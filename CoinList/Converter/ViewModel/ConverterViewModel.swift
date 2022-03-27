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
    
    let networkService = NetworkService()
    var cancellables = Set<AnyCancellable>()
    
}

extension ConverterViewModel {
    func getConverterCurrency() {

                
        var rates: AnyPublisher<ConverterRateModel, Error> {
            return networkService.fetchData(url: K.rateUrl)
        }

        var symbols: AnyPublisher<ConverterSymbolModel, Error> {
            return networkService.fetchData(url: K.symbolUrl)
        }

        rates.combineLatest(symbols)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Converter rates succesfully finished")
                case .failure(let error):
                    print("Converter rates error: \(error)")
                }
            } receiveValue: { rates, symbols in
                
                for (symbol) in rates.rates {
                    print(symbol)
                }

            }.store(in: &cancellables)
    }
}
