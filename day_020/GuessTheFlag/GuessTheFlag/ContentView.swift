//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ferdous Mahmud Akash on 7/8/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingAlart = false
    
    var body: some View {
        VStack {
            Button("Show Alart") {
                isShowingAlart = true
            }
            .buttonStyle(.borderedProminent)
            .tint(.mint)
            .alert("Important message", isPresented: $isShowingAlart) {
                Button("Delete", role: .destructive) {}
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("Please read this")
            }
        }
        .ignoresSafeArea()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
