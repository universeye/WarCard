//
//  LoadingView.swift
//  WarCard
//
//  Created by Terry Kuo on 2021/4/12.
//

import SwiftUI

struct LoadingView: View {
    
    @Binding var isLoading: Bool
    @EnvironmentObject var env: GameLogic
    
    var body: some View {
        ZStack {
            VStack {
                LottieView(filename: "8123-winner")
                    .frame(width: 200, height: 200)
                
                Button(action: {
                    isLoading = false
                    env.toZero()
                }, label: {
                    Text("Replay")
                })
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isLoading: .constant(true))
    }
}
