//
//  NetworkService.swift
//  CoinList
//
//  Created by Robert P on 23.01.2022.
//

import Foundation
import Combine

struct NetworkService {
    func fetchData<T: Decodable>(url: URL) -> AnyPublisher<T, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .retry(1)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }    
}
