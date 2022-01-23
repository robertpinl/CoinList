//
//  String+Ext.swift
//  CoinList
//
//  Created by Robert P on 23.01.2022.
//

import Foundation

extension String {
    var isProfitable: Bool {
        let value = Double(self) ?? 0.0
        return Double(value) >= 0.0 ? true : false
    }
}
