//
//  ContentView.swift
//  Lab1_elizabeth_thomas
//
//  Created by Elizabeth Thomas on 2025-02-13.
//


import SwiftUI

struct ContentView: View {
    @State private var randomNumber:Int = Int.random(in: 1...100)
    @State private var isPrime: Bool = false
    
    //to display the checkmark and xmark
    @State private var showResult: Bool = false
    @State private var showImage: String = ""
    
    //count the number of attempts
    @State private var correctAnswers:Int = 0
    @State private var wrongAnswers : Int = 0
    @State private var attempts : Int = 0
    
    //timer countdown
    @State private var countdown: Int = 5
    @State private var countdownTimer: Bool = false
    
    //show final results
    private var message: String = ""
    
    var body: some View {
        VStack {
            
            Button("Start"){ startGuessing() }
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .background(Color.purple)
                .padding(10)
                .cornerRadius(20)
                .frame(width: 400, height: 200)
            
            
            Text("\(randomNumber)")
                .font(.largeTitle)
                .padding()
            
            Text("Is \(randomNumber) Prime Number ?")
                .font(.headline)
                .padding()
            
            Text("Time left : \(countdown) seconds")
                .font(.headline)
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
            
            Text(message)
                .font(.subheadline)
                .padding()
            
            
        
        } .onAppear {resetAll() }
        // .onAppear (perform: startGuessing)
        
        
        
    }
    
    func startGuessing() {
        
        generateRandomNumber()
        startTimer()
    }
    
    func resetAll() {
        
        countdown = 5
        countdownTimer = false
        
    }
    
    func generateRandomNumber() {
        randomNumber = Int.random(in: 1...100)
        //isPrime = isPrimeNumber(randomNumber)
        
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
        
        //generateRandomNumber()
        //startTimer()
    }
    
    func startTimer() {
        
        countdownTimer = true
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in if countdown > 0 {
            countdown -= 1
        } else {
            countdownTimer = false
            timer.invalidate()
            
            showImage = "xmark.circle"
            wrongAnswers += 1
            countdown = 5
            
            
            generateRandomNumber()
            startTimer()
            
        }
            
            // randomNumber = Int.random(in: 1...100)
            // showImage = ""
        }
    }
    
    
    
    
    
}

#Preview {
    ContentView()
}
