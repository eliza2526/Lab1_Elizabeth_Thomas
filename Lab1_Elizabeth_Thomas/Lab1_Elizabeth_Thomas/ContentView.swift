//
//  ContentView.swift
//  Lab1_Elizabeth_Thomas
//
//  Created by Elizabeth Thomas on 2025-02-13.
//

import SwiftUI

struct ContentView: View {
    @State private var randomNumber:Int = Int.random(in: 1...100)
    
    //to display the checkmark and xmark
    @State private var showResult: Bool = false
    @State private var showImage: String = ""
    
    @State private var correctAnswers:Int = 0
    @State private var wrongAnswers : Int = 0
    @State private var attempts : Int = 0
    
    
    var body: some View {
        VStack {
            Text("\(randomNumber)")
                .font(.largeTitle)
                .padding()
            
            HStack {
                Button(action: {checkAnswer(isPrime: true)}, label: {
                    Text("Prime")
                        .padding(10)
                        .background(Color.teal)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
                
                Button(action: {checkAnswer(isPrime: false)}, label: {
                    Text("Not Prime")
                        .padding(10)
                        .background(Color.teal)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
            }
            
            if showResult {
                Image(systemName: showImage)
                    .foregroundColor(showImage == "checkmark.circle" ? .green : .red)
                    .font(.largeTitle)
            /* } else {
                Image (systemName: "xmark.circle")
                    .foregroundColor(.red)
                    .font(.largeTitle) */
            }
        
        } .onAppear(perform: startTimer)
        
        
        
    }
    
    func isPrimeNumber(_ number : Int) -> Bool {
        if number <= 1 { return false}
        for i in 2..<number {
            if number % i == 0 { return false }
        }
        return true
    }
    
    func checkAnswer (isPrime:Bool){
        let isCorrect = isPrime ? isPrimeNumber(randomNumber) : !isPrimeNumber(randomNumber)
        
        if isCorrect {
            correctAnswers += 1
            showImage = "checkmark.circle"
        } else {
            wrongAnswers += 1
            showImage = "xmark.circle"
        }
        
        showResult = true
        attempts += 1
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in randomNumber = Int.random(in: 1...100)
        showImage = "" }
    }
    
    
    
    
    
}

#Preview {
    ContentView()
}
