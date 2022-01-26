//
//  CoinDetailView.swift
//  CoinList
//
//  Created by Robert P on 23.01.2022.
//

import SwiftUI

struct CoinDetailView: View {
    
    var coin: Coin
    
    @Binding var showDetail: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Text("Sample text")
            }
            .frame(width: 300, height: 300)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(16)
            .overlay(alignment: .topTrailing) {
                Button {
                    withAnimation { showDetail = false }
                } label: {
                    Text("Dismiss")
                        .padding()
                }
            }
        }
        .transition(.opacity.combined(with: .opacity ))
        .zIndex(2)
    }
}

struct CoinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailView(coin: Coin(id: "1", symbol: "BTC", name: "Bitcoin", rank: 1, price_usd: "100", percent_change_24h: "1.2%"), showDetail: .constant(true))
    }
}
