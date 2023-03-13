//
//  CoinSelectionView.swift
//  CoinList
//
//  Created by Robert P on 28.03.2022.
//

import SwiftUI

struct CoinSelectionView: View {
    
    @Binding var selectedCoin: ConverterCoinModel?
    
    @ObservedObject var viewModel = ConverterViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.currencies, id: \.self) { coin in
                Text(coin.symbol)
            }
        }
    }
}

struct CoinSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CoinSelectionView(selectedCoin: .constant(ConverterCoinModel(title: "Bitcoin", symbol: "BTC", rate: 1.0)))
    }
}
