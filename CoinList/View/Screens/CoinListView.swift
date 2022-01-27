//
//  ContentView.swift
//  CoinList
//
//  Created by Robert P on 23.01.2022.
//

import SwiftUI

struct CoinListView: View {
    
    @ObservedObject var viewModel = CoinListViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView (showsIndicators: false) {
                    VStack {
                        if !viewModel.coins.isEmpty {
                            ForEach (viewModel.coins) { coin in
                                CoinView(coin: coin)
                                    .onTapGesture {
                                        withAnimation {
                                            viewModel.show(coin)
                                        }
                                    }
                            }
                        } else {
                            // Placeholder if there is no internet connection
                            Image(systemName: "wifi.slash")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 50)
                                .padding(.top, 100)
                            Text("No network connection")
                        }
                    }
                }
                .blur(radius: viewModel.showDetail ? 15 : 0)
                if viewModel.showDetail {
                    CoinDetailView(coin: viewModel.selectedCoin!, showDetail: $viewModel.showDetail)
                }
            }
            .navigationTitle(viewModel.showDetail ? "" : "Coin List")
            .onAppear {
                viewModel.getCoins()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView()
    }
}
