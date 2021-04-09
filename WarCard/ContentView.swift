//
//  ContentView.swift
//  WarCard
//
//  Created by Terry Kuo on 2021/4/9.
//

import SwiftUI

struct ContentView: View {
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
                    Image(uiImage: #imageLiteral(resourceName: "3C"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 150, alignment: .center)
                    
                    Image(uiImage: #imageLiteral(resourceName: "3C"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 150, alignment: .center)
                }
                Spacer()
                Button(action: {}, label: {
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
                        Text("0")
                    }
                    
                    VStack {
                        Text("Player")
                            .padding()
                        Text("0")
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
