//
//  TabBarView.swift
//  CoinList
//
//  Created by Robert P on 22.03.2022.
//

import SwiftUI
import BottomBar_SwiftUI


struct TabBarView: View {
    
    let items: [BottomBarItem] = [
        BottomBarItem(icon: "house.fill", title: "Top 100", color: .blue),
        BottomBarItem(icon: "clock.arrow.circlepath", title: "Converter", color: .indigo),
        BottomBarItem(icon: "gear", title: "Settings", color: Color(.darkGray))
    ]
    
    @State private var selectedIndex: Int = 0
    
    var selectedItem: BottomBarItem {
        items[selectedIndex]
    }
    
    var body: some View {
        VStack {
            ZStack {
                
                HStack {
                    Text(selectedItem.title)
                        .titleTextStyle()
                        .transaction { transaction in
                            transaction.animation = nil
                        }
                        .padding(.horizontal)
                    Spacer()
                }
                
            Rectangle()
                .frame(maxWidth: .infinity ,maxHeight: 65)
                .foregroundColor(.clear)
            }
            
            switch selectedIndex {
            case 0:
                CoinListView()
            case 1:
                ConverterView()
            case 2:
                Color.clear.ignoresSafeArea(.all)
            default:
                fatalError()
            }
            
            Rectangle()
                .frame(maxWidth: .infinity ,maxHeight: 65)
                .foregroundColor(.clear)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .bottom) {
            BottomBar(selectedIndex: $selectedIndex, items: items)
                .offset(y: 15)
            
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
