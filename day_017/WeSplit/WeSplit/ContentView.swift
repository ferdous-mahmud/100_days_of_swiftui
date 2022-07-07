//
//  ContentView.swift
//  WeSplit
//
//  Created by Ferdous Mahmud Akash on 7/7/22.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmmount = 0.0
    @State private var numberOfpeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        // Calculate tip
        let percentage = (checkAmmount / 100.00) * Double(tipPercentage)
        let toPay = (checkAmmount + percentage) / Double(numberOfpeople + 2)
        
        return toPay
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Ammount to pay", value:$checkAmmount,   format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Select number of people", selection: $numberOfpeople){
                        ForEach (2..<100) {
                        Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach (tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Total per person")
                }
                
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup (placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
