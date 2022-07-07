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
    
    let conversionTypes = ["Temperature", "Length", "Time", "Volume"]
    
    let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    let lengthUnits = ["meters", "kilometers", "feet", "yards", "miles"]
    let timeUnits = ["seconds", "minutes", "hours", "days"]
    let volumeUnits = ["milliliters", "liters", "cups", "pints", "gallons"]
    
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
            return (currentInput - 273.15)
        } else if (inputSelectedUnit == "meters" && outputSelectedUnit == "miles"){
            return (currentInput - 273.15)
        } else if (inputSelectedUnit == "kilometers" && outputSelectedUnit == "feet"){
            return (currentInput - 273.15)
        } else if (inputSelectedUnit == "kilometers" && outputSelectedUnit == "yards"){
            return (currentInput - 273.15)
        } else if (inputSelectedUnit == "kilometers" && outputSelectedUnit == "miles"){
            return (currentInput - 273.15)
        } else if (inputSelectedUnit == "feet" && outputSelectedUnit == "yards"){
            return (currentInput - 273.15)
        } else if (inputSelectedUnit == "feet" && outputSelectedUnit == "miles"){
            return (currentInput - 273.15)
        } else if (inputSelectedUnit == "yards" && outputSelectedUnit == "miles"){
            return (currentInput - 273.15)
        } // add oposit of them again
        else {
            return currentInput
        }
    }
    
    var timeOutput: Double {
        return 0.03
    }
    
    var volumeOutput: Double {
        return 0.04
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
                    Picker("Select input type", selection: $inputSelectedUnit){
                        ForEach(selectOptions, id:\.self){
                            Text($0)
                        }
                    }
                } header: {
                    Text("Input")
                }
                
                // Output
                Section{
                    Text(convertedOutput, format: .number)
                    Picker("Select input type", selection: $outputSelectedUnit){
                        ForEach(selectOptions, id:\.self){
                            Text($0)
                        }
                    }
                } header: {
                    Text("Output")
                }
            }
            .navigationTitle("UniConverter")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
