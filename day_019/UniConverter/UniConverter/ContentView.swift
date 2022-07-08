//
//  ContentView.swift
//  UniConverter
//
//  Created by Ferdous Mahmud Akash on 7/7/22.
//

import SwiftUI

struct ContentView: View {
    @State private var currentSelectionType = "Temperature"
    @State private var currentInput = 0.00
    @State private var inputSelectedUnit = "Celsius"
    @State private var outputSelectedUnit = "Kelvin"
    @FocusState private var isInputFieldFocused: Bool
    
    // Stored Properties
    let conversionTypes = ["Temperature", "Length", "Time", "Volume"]
    
    let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    let lengthUnits = ["meters", "kilometers", "feet", "yards", "miles"]
    let timeUnits = ["seconds", "minutes", "hours", "days"]
    let volumeUnits = ["milliliters", "liters", "cups", "pints", "gallons"]
    
    // MARK: View
    var body: some View {
        NavigationView{
            Form{
                // Conversion Type Selection
                Section {
                    Picker("Tip percentage", selection: $currentSelectionType) {
                        ForEach (conversionTypes, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Select your conversion type")
                }
                
                // Input
                Section{
                    TextField("Input \(currentSelectionType)", value: $currentInput, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isInputFieldFocused)
                    Picker("Select input type", selection: $inputSelectedUnit){
                        ForEach(selectOptions, id:\.self){
                            Text($0)
                        }
                    }
                } header: {
                    Text("Input \(currentSelectionType)")
                }
                
                // Output
                Section{
                    Text(convertedOutput, format: .number)
                    Picker("Select output type", selection: $outputSelectedUnit){
                        ForEach(selectOptions, id:\.self){
                            Text($0)
                        }
                    }
                } header: {
                    Text("Output \(currentSelectionType)")
                }
            }
            .navigationTitle("UniConverter")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { // Hide keyboard visiblity
                ToolbarItemGroup (placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isInputFieldFocused = false
                    }
                }
            }
        }
    }
}

// MARK: Computed Properties
extension ContentView {
    var selectOptions: [String] {
        if (currentSelectionType == "Temperature") {
            return temperatureUnits
        } else if (currentSelectionType == "Length") {
            return lengthUnits
        } else if (currentSelectionType == "Time") {
            return timeUnits
        } else {
            return volumeUnits
        }
    }
    
    var temOutput: Double {
        if (inputSelectedUnit == "Celsius" && outputSelectedUnit == "Fahrenheit") {
            return ((currentInput * 9/5) + 32)
        } else if (inputSelectedUnit == "Celsius" && outputSelectedUnit == "Kelvin"){
            return (currentInput - 273.15)
        } else if (inputSelectedUnit == "Fahrenheit" && outputSelectedUnit == "Kelvin"){
            return ((currentInput - 32) * 5/9) + 273.15
        } else if (inputSelectedUnit == "Fahrenheit" && outputSelectedUnit == "Celsius") {
            return ((currentInput - 32) * 5/9)
        } else if (inputSelectedUnit == "Kelvin" && outputSelectedUnit == "Celsius"){
            return currentInput - 273.15
        } else if (inputSelectedUnit == "Kelvin" && outputSelectedUnit == "Fahrenheit"){
            return ((currentInput - 273.15) * 9/5) + 32
        } else {
            return currentInput
        }
    }
    
    var lenOutput: Double {
        if (inputSelectedUnit == "meters" && outputSelectedUnit == "kilometers") {
            return currentInput / 1000.00
        } else if (inputSelectedUnit == "meters" && outputSelectedUnit == "feet"){
            return currentInput * 3.281
        } else if (inputSelectedUnit == "meters" && outputSelectedUnit == "yards"){
            return currentInput * 1.094
        } else if (inputSelectedUnit == "meters" && outputSelectedUnit == "miles"){
            return currentInput / 1609
        } else if (inputSelectedUnit == "kilometers" && outputSelectedUnit == "feet"){
            return currentInput * 3281
        } else if (inputSelectedUnit == "kilometers" && outputSelectedUnit == "yards"){
            return currentInput * 1094
        } else if (inputSelectedUnit == "kilometers" && outputSelectedUnit == "miles"){
            return currentInput / 1.609
        } else if (inputSelectedUnit == "feet" && outputSelectedUnit == "yards"){
            return currentInput / 3
        } else if (inputSelectedUnit == "feet" && outputSelectedUnit == "miles"){
            return currentInput / 5280
        } else if (inputSelectedUnit == "yards" && outputSelectedUnit == "miles"){
            return currentInput / 1760 /// new
        } else if (inputSelectedUnit == "kilometers" && outputSelectedUnit == "meters") {
            return currentInput * 1000.00
        } else if (inputSelectedUnit == "feet" && outputSelectedUnit == "meters"){
            return currentInput / 3.281
        } else if (inputSelectedUnit == "yards" && outputSelectedUnit == "meters"){
            return currentInput / 1.094
        } else if (inputSelectedUnit == "miles" && outputSelectedUnit == "meters"){
            return currentInput * 1609
        } else if (inputSelectedUnit == "feet" && outputSelectedUnit == "kilometers"){
            return currentInput / 3281
        } else if (inputSelectedUnit == "yards" && outputSelectedUnit == "kilometers"){
            return currentInput / 1094
        } else if (inputSelectedUnit == "miles" && outputSelectedUnit == "kilometers"){
            return currentInput * 1.609
        } else if (inputSelectedUnit == "yards" && outputSelectedUnit == "feet"){
            return currentInput * 3
        } else if (inputSelectedUnit == "miles" && outputSelectedUnit == "feet"){
            return currentInput * 5280
        } else if (inputSelectedUnit == "miles" && outputSelectedUnit == "yards"){
            return currentInput * 1760
        }
        else {
            return currentInput
        }
    }
    
    var timeOutput: Double {
        if (inputSelectedUnit == "seconds" && outputSelectedUnit == "minutes") {
            return currentInput / 60
        } else if (inputSelectedUnit == "seconds" && outputSelectedUnit == "hours"){
            return currentInput / 3600
        } else if (inputSelectedUnit == "seconds" && outputSelectedUnit == "days"){
            return currentInput / 86400
        } else if (inputSelectedUnit == "minutes" && outputSelectedUnit == "hours"){
            return currentInput / 60
        } else if (inputSelectedUnit == "minutes" && outputSelectedUnit == "days"){
            return currentInput / 1440
        } else if (inputSelectedUnit == "hours" && outputSelectedUnit == "days"){
            return currentInput / 24 // new
        } else if (inputSelectedUnit == "minutes" && outputSelectedUnit == "seconds") {
            return currentInput * 60
        } else if (inputSelectedUnit == "hours" && outputSelectedUnit == "seconds"){
            return currentInput * 3600
        } else if (inputSelectedUnit == "days" && outputSelectedUnit == "seconds"){
            return currentInput * 86400
        } else if (inputSelectedUnit == "hours" && outputSelectedUnit == "minutes"){
            return currentInput * 60
        } else if (inputSelectedUnit == "days" && outputSelectedUnit == "minutes"){
            return currentInput * 1440
        } else if (inputSelectedUnit == "days" && outputSelectedUnit == "hours"){
            return currentInput * 24
        } else {
            return currentInput
        }
    }
    
    var volumeOutput: Double {
        if (inputSelectedUnit == "milliliters" && outputSelectedUnit == "liters") {
            return currentInput / 1000
        } else if (inputSelectedUnit == "milliliters" && outputSelectedUnit == "cups"){
            return currentInput / 284.1
        } else if (inputSelectedUnit == "milliliters" && outputSelectedUnit == "pints"){
            return currentInput / 568.3
        } else if (inputSelectedUnit == "milliliters" && outputSelectedUnit == "gallons"){
            return currentInput / 4546
        } else if (inputSelectedUnit == "liters" && outputSelectedUnit == "cups"){
            return currentInput * 3.52
        } else if (inputSelectedUnit == "liters" && outputSelectedUnit == "pints"){
            return currentInput * 1.76
        } else if (inputSelectedUnit == "liters" && outputSelectedUnit == "gallons"){
            return currentInput / 4.546
        } else if (inputSelectedUnit == "cups" && outputSelectedUnit == "pints"){
            return currentInput / 2
        } else if (inputSelectedUnit == "cups" && outputSelectedUnit == "gallons"){
            return currentInput / 16
        } else if (inputSelectedUnit == "pints" && outputSelectedUnit == "gallons"){
            return currentInput / 8 // new
        } else if (inputSelectedUnit == "liters" && outputSelectedUnit == "milliliters") {
            return currentInput * 1000
        } else if (inputSelectedUnit == "cups" && outputSelectedUnit == "milliliters"){
            return currentInput * 284.1
        } else if (inputSelectedUnit == "pints" && outputSelectedUnit == "milliliters"){
            return currentInput * 568.3
        } else if (inputSelectedUnit == "gallons" && outputSelectedUnit == "milliliters"){
            return currentInput * 4546
        } else if (inputSelectedUnit == "cups" && outputSelectedUnit == "liters"){
            return currentInput / 3.52
        } else if (inputSelectedUnit == "pints" && outputSelectedUnit == "liters"){
            return currentInput / 1.76
        } else if (inputSelectedUnit == "gallons" && outputSelectedUnit == "liters"){
            return currentInput * 4.546
        } else if (inputSelectedUnit == "pints" && outputSelectedUnit == "cups"){
            return currentInput * 2
        } else if (inputSelectedUnit == "gallons" && outputSelectedUnit == "cups"){
            return currentInput * 16
        } else if (inputSelectedUnit == "gallons" && outputSelectedUnit == "pints"){
            return currentInput * 8
        }
        else {
            return currentInput
        }
    }
    
    var convertedOutput: Double {
        if (currentSelectionType == "Temperature") {
            return temOutput
        } else if (currentSelectionType == "Length") {
            return lenOutput
        } else if (currentSelectionType == "Time") {
            return timeOutput
        } else {
            return volumeOutput
        }
    }
}

// MARK: Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
