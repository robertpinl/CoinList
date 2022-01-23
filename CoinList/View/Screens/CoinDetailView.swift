//
//  CoinDetailView.swift
//  CoinList
//
//  Created by Robert P on 23.01.2022.
//

import SwiftUI

struct CoinDetailView: View {
    
    var coin: Coin
    
    var body: some View {
        ZStack {
            VStack {
                Text()
            }
            .frame(height: 300)
            .background(Color(.secondarySystemBackground))
        }
    }
}

struct CoinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailView()
    }
}
