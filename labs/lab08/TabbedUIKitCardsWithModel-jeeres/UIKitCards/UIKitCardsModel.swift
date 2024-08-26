//
//  UIKitCardModel.swift
//  UIKitCards
//
//  Created by Joshua Eres on 1/25/24.
//

import Foundation

class UIKitCardsModel{
    let questions=["What is the capital of Illinois?","What is the square root of 4?","What is the capital of the United States?"]
    let answers=["Springfield","2","Washington D.C."]
    var x = 0
    
    func getNextQuestion() -> String{
        x+=1
        return questions[x%3]
    }
    
    func getAnswer() -> String{
        return answers[x%3]
    }
}
