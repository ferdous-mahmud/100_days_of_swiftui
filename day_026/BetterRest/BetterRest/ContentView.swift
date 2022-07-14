//
//  ContentView.swift
//  BetterRest
//
//  Created by Ferdous Mahmud Akash on 7/14/22.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        VStack{
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 6...12, step: 0.25)
                .padding(.horizontal)
            DatePicker("Wake up at: \(wakeUp.formatted())", selection: $wakeUp, in: Date.now..., displayedComponents: .hourAndMinute)
                .padding(.horizontal)
                .labelsHidden()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
