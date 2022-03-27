//
//  Text+Ext.swift
//  CoinList
//
//  Created by Robert P on 26.03.2022.
//

import SwiftUI

extension Text {
    func titleTextStyle() -> some View {
        self.foregroundColor(.primary)
            .font(.custom("Montserrat-ExtraBold", size: 32))
    }
}
