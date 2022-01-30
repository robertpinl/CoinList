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
                        ForEach (viewModel.coins) { coin in
                            CoinView(coin: coin)
                                .onTapGesture {
                                    withAnimation {
                                        viewModel.show(coin)
                                    }
                                }
                        }
                    }
                }
                .blur(radius: viewModel.showDetail ? 15 : 0)
                
                if viewModel.showDetail {
                    CoinDetailView(coin: viewModel.selectedCoin!, showDetail: $viewModel.showDetail)
                }
                
                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(1.5)
                        .offset(y: -60)
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
