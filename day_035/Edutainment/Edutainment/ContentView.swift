//
//  ContentView.swift
//  Edutainment
//
//  Created by Ferdous Mahmud Akash on 7/23/22.
//

import SwiftUI

struct ContentView: View {
    @State private var timeTableNumber = 12
    @State private var questionCount = 10
    @State private var isShowingQuestion = false
    
    var questionArray = ["3 * 4 = ?", "5 * 6 = ?"]
    
    let questionSelectionOption = [5, 10, 20]
    
    
    var body: some View {
        VStack {
            ZStack {
                Stepper("Time table for", value: $timeTableNumber, in: 2...12)
                    .padding()
                Text("\(timeTableNumber)")
                    .padding(8)
                     .font(.system(size: 15, weight: Font.Weight.bold))
                     .foregroundColor(Color.black)
                     .background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
                
            }
            HStack {
                Text("How many question you want?")
                    .padding()
                Spacer()
                Picker("Question count: \(questionCount)", selection: $questionCount) {
                    ForEach (questionSelectionOption, id: \.self) {
                        Text("\($0)")
                    }
                }.padding()
                    .pickerStyle(.segmented)
            }
            Button("Generate Question") {
                isShowingQuestion = true
            }
            .padding()
            .background(.white)
            .foregroundColor(.black)
            .font(.body.bold())
            .cornerRadius(15)
            
            if isShowingQuestion {
                let ansArray = [22, 55, 62]
                
                List {
                    ForEach(questionArray, id: \.self) { question in
                        HStack {
                            Text(question)
                            ForEach(ansArray, id: \.self) {
                                Button("\($0)"){
                                    /// Button tapped
                                }
                            }.padding()
                        }
                        .padding()
                    }.listRowBackground(Color.green)
                }
            }
            Spacer()
        }.background(Color(red: 69/255, green: 204/255, blue: 155/255))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
