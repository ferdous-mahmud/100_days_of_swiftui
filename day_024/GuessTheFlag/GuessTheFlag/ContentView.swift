//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ferdous Mahmud Akash on 7/8/22.
//

import SwiftUI

struct FlagImage: View {
    let imageName: String
    
    @ViewBuilder var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct LeargeBlueText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.blue)
    }
}

extension View {
    func leargeBlueText() -> some View {
        modifier(LeargeBlueText())
    }
}

struct ContentView: View {
    @State private var isShowingScore = false
    @State private var isEndGame = false
    @State private var scoreTitle = ""
    @State private var countries = allCountries.shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var wrongAns = 0
    
    static let allCountries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria","Poland", "Russia", "Spain", "UK", "US" ]
    
    var body: some View {
        ZStack{
            // Works as background color
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.75, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Text("Guess The Flag")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                VStack (spacing: 15) {
                    VStack{
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text("\(countries[correctAnswer])")
                            .leargeBlueText()
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            //FlagImage
                            FlagImage(imageName: countries[number])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $isShowingScore){
            Button("Continue", action: askQuestion)
        }
        .alert("END", isPresented: $isEndGame){
            Button("Restart", action: reStart)
        } message: {
            Text("""
                Your guess
                Correct: \(score)  Wrong: \(wrongAns)
                Out of 8
            """)
        }
    }
    
    func flagTapped(_ number: Int) {
        if correctAnswer == number {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong! That’s the flag of \(countries[number])"
            wrongAns += 1
        }
        isShowingScore = true
    }
    
    func askQuestion() {
        // Remove asked quesiton
        countries.remove(at: correctAnswer)
        
        if score + wrongAns == 8 {
            isEndGame = true
        } else {
            countries = countries.shuffled()
            correctAnswer = Int.random(in: 0...2)
        }
    }
    
    func reStart() {
        countries = Self.allCountries
        score = 0
        wrongAns = 0
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
