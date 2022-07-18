//
//  ContentView.swift
//  WordScramble
//
//  Created by Ferdous Mahmud Akash on 7/17/22.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWord = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var isShowingError = false
    
    
    var body: some View {
        NavigationView{
            List {
                Section {
                    TextField("Please entar your word: ", text: $newWord)
                        .autocapitalization(.none)
                }
                Section {
                    ForEach(usedWord, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $isShowingError) {
                Button("OK") {}
            } message: {
                Text(errorMessage)
            }
        }
    }
    
    
    private func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else {return}
        
        guard isOriginal(word: answer) else {
            showWordError(title: "Word used alerady", message: "Be more original!")
            return
        }
        
        guard isPossible(word: answer) else {
            showWordError(title: "Word not possible", message: "You can't spell the word from \(rootWord)")
            return
        }
        
        guard isReal(word: answer) else {
            showWordError(title: "Word not recognized", message: "You can't just make up, you know!")
            return
        }
        
        
        
        withAnimation {
            usedWord.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    private func startGame() {
        if let startWordURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordURL) {
                let allWord = startWords.components(separatedBy: "\n")
                rootWord = allWord.randomElement() ?? "silkworm"
                return
            }
        }
        
        // Error
        fatalError("Could not load start.txt from app bundle.")
    }
    
    private func isOriginal(word: String) -> Bool {
        !usedWord.contains(word)
    }
    
    private func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    private func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf8.count)
        let misspalledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspalledRange.location == NSNotFound
    }
    
    private func showWordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        isShowingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
