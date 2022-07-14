//
//  ContentView.swift
//  PaperAndRock
//
//  Created by Ferdous Mahmud Akash on 7/14/22.
//

import SwiftUI

struct ContentView: View {
    @State private var optionsArray = options.shuffled()
    @State private var question = questionsArray.randomElement()!
    @State private var isShowingResult = false
    @State private var computerChoice = options.randomElement()!
    @State private var questionCount = 0
    @State private var score = 0
    
    static let options = ["🤚","✊","✌️"]
    static let questionsArray = ["Which one loses?", "Which one wins?"]
    static let correctAns = [
        //computer choice, question, players choice
        ["✊","Which one wins?","🤚"],
        ["✊","Which one loses?","✌️"],
        ["✌️","Which one wins?","✊"],
        ["✌️","Which one loses?","🤚"],
        ["🤚","Which one wins?","✌️"],
        ["🤚","Which one loses?","✊"]
    ]
    
    var body: some View {
        VStack{
            Spacer()
            Text("Computer has played...")
                .font(.title2.weight(.semibold))
            Text(computerChoice)
                .font(.system(size: 200))
            Text(question)
                .font(.title2.weight(.semibold))
                .foregroundColor(question == ContentView.questionsArray[0] ? .red : .black)
            HStack{
                ForEach(optionsArray, id: \.self){ option in
                    Button {
                        judgeAnswer(selectedOption: option)
                    } label: {
                        Text(option)
                            .font(.system(size: 100))
                    }
                }
            }
            Spacer()
            Spacer()
            Text("Score: \(score)")
                .font(.title2.weight(.semibold))
            Spacer()
        }
        .alert("Game Over",isPresented: $isShowingResult){
            Button("Play Again", action: reset)
        } message: {
            Text("Your score is: \(score)")
        }
    }
    
   
    private func judgeAnswer(selectedOption: String) {
        let selectedAns = [computerChoice, question, selectedOption]
        
        if ContentView.correctAns.contains(selectedAns) {
            score += 1
        } else {
            if score > 0 {
                score -= 1
            }
        }
        
        questionCount += 1
        if questionCount == 10 {
            isShowingResult = true
        } else {
            question = ContentView.questionsArray.randomElement() ?? "Which one loses?"
            optionsArray = optionsArray.shuffled()
            computerChoice = optionsArray.randomElement() ?? "🤚"
        }
    }
    
    private func reset() {
        score = 0
        questionCount = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
