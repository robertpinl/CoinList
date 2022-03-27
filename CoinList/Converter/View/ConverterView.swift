//
//  ConverterView.swift
//  CoinList
//
//  Created by Robert P on 25.03.2022.
//

import SwiftUI

struct ConverterView: View {
    
    @ObservedObject var viewModel = ConverterViewModel()
    
    var body: some View {
        HStack {
            
            Text("")
            Text("")
            
            
        }
        .onAppear {
            ConverterViewModel().getConverterCurrency()
        }
    }
}

struct ConverterView_Previews: PreviewProvider {
    static var previews: some View {
        ConverterView()
    }
}

struct SelectionView: View {
    
    let coin: ConverterCoinModel
    
    var body: some View {
        HStack {
            VStack {
                Text(coin.title)
                Text(coin.symbol)
            }
        }
    }
}
