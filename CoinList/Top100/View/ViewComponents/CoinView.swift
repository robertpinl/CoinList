//
//  CoinView.swift
//  CoinList
//
//  Created by Robert P on 23.01.2022.
//https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/btc.svg

import SwiftUI

import SwiftUI

struct CoinView: View {
    
    let coin: Top100Coin
    let profitGradient = LinearGradient(gradient: Gradient(colors: [.clear, .clear, .green]), startPoint: .leading, endPoint: .trailing)
    let lossGradient = LinearGradient(gradient: Gradient(colors: [.clear, .clear, .red]), startPoint: .leading, endPoint: .trailing)
    
    let viewModel = CoinListViewModel()
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://assets.coincap.io/assets/icons/\(coin.symbol.lowercased())@2x.png")) { image in
                image
                    .resizable()
                    .opacity(0.9)
            } placeholder: {
                Color.gray.opacity(0.1)
            }
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
                Text("$") + Text(coin.priceUsd)
                HStack(spacing: 4) {
                    Image(systemName: coin.changePercent24Hr.isProfitable ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 7)
                    Text("\(coin.changePercent24Hr)%")
                        .font(.caption)
                }
                .foregroundColor(coin.changePercent24Hr.isProfitable ? .green : .red)
            }
        }
        .frame(height: 65)
        .padding(.horizontal)
        .background(.ultraThickMaterial)
        .background(coin.changePercent24Hr.isProfitable ? profitGradient : lossGradient)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal, 5)
    }
}

//struct CoinView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinView(coin: Top100Coin(id: "1", symbol: "BTC", name: "Bitcoin", rank: 1, price_usd: "100", percent_change_24h: "1.2%", market_cap_usd: "691657315747.41"))
//    }
//}
