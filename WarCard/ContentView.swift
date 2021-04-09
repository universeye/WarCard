//
//  ContentView.swift
//  WarCard
//
//  Created by Terry Kuo on 2021/4/9.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCardNumber: Int = 3
    @State var botCardNumber: Int = 4
    @StateObject var gameLogic = GameLogic()
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            VStack {
                Image(uiImage: #imageLiteral(resourceName: "tfc_logo"))
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                HStack(spacing: 50) {
                    VStack {
                        Text("Player")
                        Image("\(playerCardNumber)C")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 150, alignment: .center)
                    }
                    
                    VStack {
                        Text("Bot")
                        Image("\(botCardNumber)C")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 150, alignment: .center)
                    }
                }
                Spacer()
                Button(action: {
                    self.playerCardNumber = Int.random(in: 1...13)
                    self.botCardNumber = Int.random(in: 1...13)
                    gameLogic.compare(player: playerCardNumber, bot: botCardNumber)
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
                            .padding()
                        Text("\(gameLogic.playerNumber)").bold()
                    }
                    
                    VStack {
                        Text("Bot")
                            .padding()
                        Text("\(gameLogic.botNumber)").bold()
                    }
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
