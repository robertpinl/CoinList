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
        VStack {
            SelectionView(selectedCoin: $viewModel.firstCoin)
        }
        .onAppear {
//            viewModel.getConverterCurrency()
        }
    }
}

struct ConverterView_Previews: PreviewProvider {
    static var previews: some View {
        ConverterView()
    }
}

struct SelectionView: View {
        
    @Binding var selectedCoin: ConverterCoinModel?
    
    var body: some View {
        HStack {
                Button {
                    
                } label: {
                    VStack {
                        NavigationLink {
                            CoinSelectionView(selectedCoin: $selectedCoin)
                        } label: {
                            Text(selectedCoin?.symbol ?? "/")
                        }
                }
            }
        }
    }
}
