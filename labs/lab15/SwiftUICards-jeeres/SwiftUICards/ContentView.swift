//
//  ContentView.swift
//  SwiftUICards
//
//  Created by Joshua Eres on 2/28/24.
//

import SwiftUI
 var myModel = UIKitCardsModel()
struct ContentView: View {
    @State var questionText: String = myModel.questions[myModel.x]
    @State var answerText: String = "???"
    var body: some View {
        Color.blue.ignoresSafeArea().overlay(
            
            VStack() {
                
                Text(questionText).frame(width: 320.0, height: 50.0).background(.green).padding(.bottom,20).padding(.top,150)
                
                Text(answerText).frame(width: 320.0, height: 50.0).background(.green).padding(.bottom,100)
                
                Button(action: {
                    if(answerText == myModel.getAnswer()){
                        answerText = "???"
                    }
                    else{
                        answerText = myModel.getAnswer()
                    }
                    
                }, label: {
                    Text("Show Answer").foregroundColor(.black)
                }).frame(width: 200.0, height: 50.0).background(.yellow).padding(.bottom,0)
                
                Button(action: {
                    questionText = myModel.getNextQuestion()
                    answerText = "???"
                }, label: {
                    Text("Next Question").foregroundColor(.black)
                }).frame(width: 200.0, height: 50.0).background(.yellow).padding()
            
            }
                .padding(.bottom, 200.0))
        
    }
}

#Preview {
    ContentView()
}
