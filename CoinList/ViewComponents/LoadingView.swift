//
//  LoadingView.swift
//  CoinList
//
//  Created by Robert P on 08.03.2022.
//

import SwiftUI

@MainActor struct LoadingView: View {
    
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Color(.systemBackground).opacity(0.85)
                .ignoresSafeArea(.all)
                .overlay {
                    ZStack {
                    Circle()
                        .stroke(Color(.secondarySystemBackground), lineWidth: 7)
                        .frame(width: 40, height: 40)
                    Circle()
                        .trim(from: 0, to: 0.2)
                        .stroke(Color.blue, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                        .frame(width: 40, height: 40)
                        .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                        .animation(.linear(duration: 0.5).repeatForever(autoreverses: false), value: isLoading)
                    }
                    .offset(y: -80)
                }
            
        }
        .onAppear {
            withAnimation {
            self.isLoading = true
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView( )
    }
}
