//
//  ContentView.swift
//  viewModifiersPractice
//
//  Created by Ferdous Mahmud Akash on 7/11/22.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    
    let greeting = Text("Welcome")
    
    var text: some View {
        Group {
            Text("Hello")
                .foregroundColor(.green)
            Text("World")
                .foregroundColor(.red)
        }
    }
    
    // prefer to use @ViewBuilder
    @ViewBuilder var anotherText: some View {
            Text("Some text")
            Text("Some another text")
    }
    
    
    var body: some View {
        VStack{
            greeting
            HStack{
                text
                anotherText
            }
            anotherText
            CapsuleText(text: "Tap me")
            CapsuleText(text: "Download")
            GridStack(rows: 3, columns: 4) { row, col in
                VStack{
                    Text("row: \(row) ")
                    Text("column: \(col)")
                }
            }
        }
    }
}

// Reusable view component
struct CapsuleText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding()
            .background(.green)
            .clipShape(Capsule())
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

