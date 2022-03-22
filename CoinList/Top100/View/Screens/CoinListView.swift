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
                List {
                    ForEach (viewModel.coins) { coin in
                        CoinView(coin: coin)
                            .onTapGesture {
                                withAnimation {
                                    viewModel.show(coin)
                                }
                            }
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.inset)
                .refreshable {
                    viewModel.getCoins()
                }
                if viewModel.showDetail {
                    CoinDetailView(coin: viewModel.selectedCoin!, showDetail: $viewModel.showDetail)
                }
                
                if viewModel.isLoading {
                    withAnimation {
                        LoadingView()
                    }
                }
            }
            .navigationTitle("Coin List")
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
