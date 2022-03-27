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
            
            if viewModel.showDetail {
                CoinDetailView(coin: viewModel.selectedCoin!, showDetail: $viewModel.showDetail)
            }
            
            if viewModel.isLoading {
                withAnimation {
                    LoadingView()
                }
            }
        }
        .onAppear {
            viewModel.getCoins()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView()
    }
}
