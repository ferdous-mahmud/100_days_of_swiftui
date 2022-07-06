//
//  ContentView.swift
//  WeSplit
//
//  Created by Ferdous Mahmud Akash on 7/6/22.
//

import SwiftUI

struct ContentView: View {
    let actors = ["Harry", "Hermoiney", "Ron"]
    @State private var favActors = "Harry"
    @State private var name = ""
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Enter your name", text: $name)
                Section {
                    Picker("Select your fav actor", selection: $favActors) {
                        ForEach(actors, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Text("Your name is \(name)")
                Text("Your fav actor is \(favActors)")
                Section {
                    Button("Reset default") {
                        name = ""
                        favActors = "Harry"
                    }
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
.previewInterfaceOrientation(.portrait)
        }
    }
}
