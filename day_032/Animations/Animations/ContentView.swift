//
//  ContentView.swift
//  Animations
//
//  Created by Ferdous Mahmud Akash on 7/21/22.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        ZStack {
            Color("appBG")
            .ignoresSafeArea()
            Button(){
                // Do notihing
            } label: {
                Image(systemName: "arrow.down")
                    .font(.largeTitle.weight(.bold))
            }
            .padding(50)
            .foregroundColor(.white)
            .background(.green)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.green)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeInOut(duration: 1)
                            .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
            ).onAppear{
                animationAmount = 2
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
