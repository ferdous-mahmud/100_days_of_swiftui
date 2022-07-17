//
//  ContentView.swift
//  WordScramble
//
//  Created by Ferdous Mahmud Akash on 7/17/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Section("Section 1") {
                ForEach(1..<3){
                    Text("Dynamic row \($0)")
                }
            }
            
            Section("Section 2") {
                ForEach(1..<5){
                    Text("Dynamic row \($0)")
                }
            }
            
            Section("Section 3") {
                ForEach(1..<60){
                    Text("Dynamic row \($0)")
                }
            }
        }.listStyle(.grouped)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
