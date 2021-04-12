//
//  ContentView.swift
//  WarCard
//
//  Created by Terry Kuo on 2021/4/9.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCardNumber: Int = 3
    @State private var botCardNumber: Int = 4
    //@StateObject var gameLogic = GameLogic()
    @State var isWinning = false
    @State var isLosing = false
    @EnvironmentObject private var env: GameLogic
    
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
                .ignoresSafeArea()
            VStack {
                Image(uiImage: #imageLiteral(resourceName: "tfc_logo"))
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 170)
                Text("War Card Game")
                    .foregroundColor(.white)
                    .bold()
                Divider()
                Spacer()
                HStack(spacing: 50) {
                    VStack {
                        Text("Player")
                        Image("\(playerCardNumber)C")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90, height: 150, alignment: .center)
                    }
                    
                    VStack {
                        Text("Bot")
                        Image("\(botCardNumber)C")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90, height: 150, alignment: .center)
                    }
                }
                Spacer()
                Button(action: {
                    self.playerCardNumber = Int.random(in: 1...13)
                    self.botCardNumber = Int.random(in: 1...13)
                    env.compare(player: playerCardNumber, bot: botCardNumber)
                    //print("your number: \(env.playerNumber)")
                    
                    
                    if env.playerNumber == 10 {
                        isWinning = true
                    } else if env.botNumber == 10 {
                        isLosing = true
                    }
                    
                }, label: {
                    Image(uiImage: #imageLiteral(resourceName: "buttons167"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 280, height: 70, alignment: .center)
                        .overlay(Text("Play")
                                    .foregroundColor(.black))
                })
                Spacer()
                HStack {
                    VStack {
                        Text("Player")
                            .font(.title)
                            .padding()
                        Text("\(env.playerNumber)")
                            .bold()
                            .font(.title)
                    }
                    
                    VStack {
                        Text("Bot")
                            .font(.title)
                            .padding()
                        Text("\(env.botNumber)")
                            .bold()
                            .font(.title)
                    }
                }
                Spacer()
            }
            if isWinning {
                LoadingView(winStatus: .win, winOrLose: "Win", isWinning: $isWinning, isLosing: $isLosing)
            }
            
            if isLosing {
                LoadingView(winStatus: .lose, winOrLose: "Lose", isWinning: $isWinning, isLosing: $isLosing)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GameLogic())
    }
}
