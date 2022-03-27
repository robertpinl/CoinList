//
//  CoinView.swift
//  CoinList
//
//  Created by Robert P on 23.01.2022.
//

import SwiftUI

import SwiftUI

struct CoinView: View {
    
    let coin: Top100Coin
    let profitGradient = LinearGradient(gradient: Gradient(colors: [.clear, .clear, .green]), startPoint: .leading, endPoint: .trailing)
    let lossGradient = LinearGradient(gradient: Gradient(colors: [.clear, .clear, .red]), startPoint: .leading, endPoint: .trailing)
    
    let viewModel = CoinListViewModel()
    
    var body: some View {
        HStack {
            Image(viewModel.isImageAvailable(coin.symbol.lowercased()) ? coin.symbol.lowercased() : "generic")
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 6) {
                Text(coin.name)
                    .font(.headline )
                Text(coin.symbol)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            
            VStack(alignment: .trailing, spacing: 6) {
                Text("$") + Text(coin.price_usd)
                HStack(spacing: 4) {
                    Image(systemName: coin.percent_change_24h.isProfitable ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 7)
                    Text("\(coin.percent_change_24h)%")
                        .font(.caption)
                }
                .foregroundColor(coin.percent_change_24h.isProfitable ? .green : .red)
            }
        }
        .frame(height: 65)
        .padding(.horizontal)
        .background(.ultraThickMaterial)
        .background(coin.percent_change_24h.isProfitable ? profitGradient : lossGradient)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal, 5)
    }
}

struct CoinView_Previews: PreviewProvider {
    static var previews: some View {
        CoinView(coin: Top100Coin(id: "1", symbol: "BTC", name: "Bitcoin", rank: 1, price_usd: "100", percent_change_24h: "1.2%", market_cap_usd: "691657315747.41"))
    }
}
