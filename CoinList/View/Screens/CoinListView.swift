//
//  ContentView.swift
//  CoinList
//
//  Created by Robert P on 23.01.2022.
//

import SwiftUI

struct CoinListView: View {
    
    @StateObject var viewModel = CoinListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView (showsIndicators: false) {
                VStack {
                    ForEach (viewModel.coins) { CoinView(coin: $0) }
                    .onTapGesture {
                        
                    }
                }
                .navigationTitle("Coin List")
                .onAppear {
                    viewModel.getCoins()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView()
    }
}
