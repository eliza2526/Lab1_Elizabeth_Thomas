//
//  ContentView.swift
//  Lab1_Elizabeth_Thomas
//
//  Created by Elizabeth Thomas on 2025-02-11.
//

import SwiftUI

struct ContentView: View {
    @State private var randomNumber: Int = Int.random(in: 1...100)
    @State private var answerDisplay: Bool = true
    @State private var answerImage: String = ""
    @State private var correctAnswers:Int = 0
    @State private var wrongAnswers: Int = 0
    @State private var attempts: Int = 0
    
    
    var body: some View {
        VStack {
            Text("\(randomNumber)")
                .font(.largeTitle)
                .padding()
            
            HStack{
                Button(action: {checkAnswer(isPrime: true)}, label: {
                    Text("Prime")
                        .font(.title)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 20)
                        .cornerRadius(10)
                    
                    
                })
                
                Button(action: {checkAnswer(isPrime: false)}, label: {
                    Text("Not Prime")
                        .font(.title)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 20)
                        .cornerRadius(10)
                    
                    
                })
            }
            .padding()
            
            if answerDisplay {
                Image(systemName: answerImage)
                    .foregroundColor(answerImage == "checkmark.circle" ? .green:.red)
                    .font(.largeTitle)
            }
            
        }
            
        }
    
    
    
    func generateNewNumber() {
        randomNumber = Int.random(in: 1...100)
        answerImage = ""
        answerDisplay = false
    }
    
    
    
    
    
    
    func isPrimeNumber(_ number: Int) -> Bool {
        if number <= 1 { return false }
        for i in 2..<number {
            if number % i == 0 { return false }
        }
        return true
    }
    
    
    
    
    
    func checkAnswer(isPrime:Bool){
        let isCorrect = isPrime ? isPrimeNumber(randomNumber) : !isPrimeNumber(randomNumber)
        
        if isCorrect {
            correctAnswers += 1
            answerImage = "checkmark.circle"
        } else {
            wrongAnswers += 1
            answerImage = "xmark.circle"
        }
        
        answerDisplay = true
        attempts += 1
    }
    
    
    
    
    
    
    
}

#Preview {
    ContentView()
}
