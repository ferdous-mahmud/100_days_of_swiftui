//
//  ContentView.swift
//  BetterRest
//
//  Created by Ferdous Mahmud Akash on 7/14/22.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var wakeUp = Date.now
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var isShowingAlert = false
    
    var body: some View {
        NavigationView {
            VStack{
                Group {
                    Text("When do you want to weakup?")
                        .font(.headline)
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                    
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 6...12, step: 0.25)
                    
                    Text("Daily coffee intake")
                        .font(.headline)
                    
                    Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups" , value: $coffeeAmount, in: 1...10)
                }
                .padding(.horizontal)
                Spacer()
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedTime)
            }
            .alert(alertTitle, isPresented: $isShowingAlert) {
                Button("Done"){}
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    private func calculateBedTime(){
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 3600
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bed time is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        
        } catch {
            alertTitle = "Error"
            alertMessage = error.localizedDescription
        }
        
        isShowingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
