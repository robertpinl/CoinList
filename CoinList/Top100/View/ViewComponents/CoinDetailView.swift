//
//  CoinDetailView.swift
//  CoinList
//
//  Created by Robert P on 23.01.2022.
//

import SwiftUI

struct CoinDetailView: View {
    var coin: Top100Coin
    
    @Binding var showDetail: Bool
    
    let viewModel = CoinListViewModel()
    
    var body: some View {
        ZStack {
            Color(.systemBackground).opacity(0.9)
                .ignoresSafeArea(.all)
            VStack {
                Text(coin.name)
                    .font(.title3)
                    .bold()
                    .padding(.top, 30)
                Text(coin.symbol)
                    .font(.caption)
                    .padding(.bottom, 30)
                HStack {
                    CoinInfoView(headline: "RANK", text: "#\(coin.rank)")
                    Divider()
                        .frame(height: 25)
                    CoinInfoView(headline: "PRICE", text: "$\(coin.priceUsd.noDecimal)")
                    Divider()
                        .frame(height: 25)
                    CoinInfoView(headline: "MARKET CAP", text: (Double(coin.volumeUsd24Hr) ?? 0.0).formattedPoints())
                }
            }
            .frame(height: 230)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(16)
            .overlay(alignment: .topTrailing) {
                Button {
                    withAnimation { showDetail = false }
                } label: {
                    DismissButton()
                }
            }
            AsyncImage(url: URL(string: "https://assets.coincap.io/assets/icons/\(coin.symbol.lowercased())@2x.png")!) { image in
                image.resizable()
            } placeholder: {
                Color.gray.opacity(0.1)
            }
            .frame(width: 75, height: 75)
            .clipShape(Circle())
            .shadow(color: .black.opacity(0.5), radius: 4, x: 0, y: 4)
            .offset(y: -120)
        }
        .transition(.opacity.combined(with: .opacity ))
        .zIndex(2)
    }
}

//struct CoinDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinDetailView(coin: Top100Coin(id: "1", symbol: "BTC", name: "Bitcoin", rank: 1, price_usd: "100", percent_change_24h: "1.2%", market_cap_usd: "691657315747.41"), showDetail: .constant(true))
//    }
//}

struct CoinInfoView: View {
    
    let headline: String
    let text: String
    
    var body: some View {
        VStack {
            Text(headline)
                .font(.caption2)
                .foregroundColor(.secondary)
                .padding(.bottom, 1)
            Text(text)
                .bold()
                .lineLimit(1)
                .minimumScaleFactor(0.5)
        }
        .frame(width: 75)
        .padding(.horizontal)
    }
}
