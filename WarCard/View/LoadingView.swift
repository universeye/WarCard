//
//  LoadingView.swift
//  WarCard
//
//  Created by Terry Kuo on 2021/4/12.
//

import SwiftUI

enum WinStatus: String {
    case win = "8123-winner"
    case lose = "41294-quiz-guy-loser"
}

struct LoadingView: View {
    
    var winStatus: WinStatus
    var winOrLose: String = "Win"
    @Binding var isWinning: Bool
    @Binding var isLosing: Bool
    @EnvironmentObject private var env: GameLogic
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.7).ignoresSafeArea()
            VStack {
                Text("You \(winOrLose)!")
                    .bold()
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                
                LottieView(filename: winStatus.rawValue)
                    .frame(width: 200, height: 200)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                
                Button(action: {
                    isWinning = false
                    isLosing = false
                    env.toZero()
                }, label: {
                    Text("Replay")
                        .bold()
                        .font(.system(size: 20))
                })
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(winStatus: .win, isWinning: .constant(true), isLosing: .constant(false))
    }
}
