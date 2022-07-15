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
    @State private var wakeUp = defaultWeakUptime
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var isShowingAlert = false
    
    static var defaultWeakUptime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            VStack{
                Form {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("When do you want to weakup?")
                            .font(.headline)
                        
                        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Desired amount of sleep")
                            .font(.headline)
                        
                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 6...12, step: 0.25)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Daily coffee intake")
                            .font(.headline)
                        
                        Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups" , value: $coffeeAmount, in: 1...10)
                    }
                }
                Spacer()
            }
            .navigationBarItems(
                leading: Text("BetterRest")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding(.horizontal)
            )
            .toolbar {
                Button("Calculate", action: calculateBedTime)
                    .padding(.horizontal)
                    .background(.green)
                    .foregroundColor(.secondary)
                    .font(.body.weight(.semibold))
                    .cornerRadius(10)
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
