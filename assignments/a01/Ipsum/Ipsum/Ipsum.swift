//
//  Ipsum.swift
//  Ipsum
//
//  Created by Vedaant Modi on 2/13/24.
//

import Foundation

class Ipsum{
    let fruitWords: [String] = ["lemon", "strawberry", "orange", "pear", "kiwi"]
    let toolWords: [String] = ["hammer", "wrench", "screwdriver", "ratchet", "socket"]
    let clothesWords: [String] = ["shirt", "pants", "scarf", "hat", "shoes"]
    let musicWords: [String] = ["guitar", "rock", "flute", "violin", "country"]
    let languageWords: [String] = ["english", "french", "russian", "chinese", "japanese"]
    
    let fruitAnswers: [String] = ["I love fruit! ", "Fruit are very healthy! ", "I love sweet fruit! ", "Did you know tomatoes are fruit? ", "Make sure to eat healthy! "]
    let toolAnswers: [String] = ["Do you work in a wood shop? ", "I work with tools all the time! ", "What tools do you work with? ", "Tools are expensive! ", "I like working on cars. You have to use a lot of tools! "]
    let clothesAnswers: [String] = ["Do you like to shop for clothes? ", "Clothes can be expensive! ", "What is your favorite place to shop for clothes! ", "Do you shop for clothes online or in a store? ", "What is your favorite brand of clothes? "]
    let musicAnswers: [String] = ["I love listening to music! ", "I like playing Guitar Hero because it allows me to play with music I like. ", "What is your favorite artist? ", "Do you play any instruments? ", "When do you like listening to music the most? "]
    let languageAnswers: [String] = ["What languages do you speak? ", "What was your first language? ", "Do you speak another language besides English? ", "I've always wanted to learn a language! ", "I took Spanish classes in school! "]
    let outputAnswers: [String] = ["Ask me more! ", "Cool! ", "How interesting! ", "Riveting information! ", "I'm on the edge of my seat! "]
    
    var inputArr: [String] = []
    var outputArr: [String] = []
    
    func oneInteraction(input:String) -> String {
        inputArr.append(input.components(separatedBy: "\n")[0])
        let outStr: String = parseInput(input: input)
        outputArr.append(outStr)
        print(inputArr)
        print(outputArr)
        return outStr
        
    }
    
    func parseInput(input:String) -> String {
        var answered: Bool = false
        var output: String = ""
        var words: [String] = input.lowercased().components(separatedBy: "\n")[0].components(separatedBy: CharacterSet(charactersIn: " .,!?;:()[]{}"))
        print(words)
        for word in words{
            var random: Int = Int.random(in: 0..<5)
            if(fruitWords.contains(word)){
                output += fruitAnswers[random]
                answered = true
            }
            if(toolWords.contains(word)){
                output += toolAnswers[random]
                answered = true
            }
            if(clothesWords.contains(word)){
                output += clothesAnswers[random]
                answered = true
            }
            if(musicWords.contains(word)){
                output += musicAnswers[random]
                answered = true
            }
            if(languageWords.contains(word)){
                output += languageAnswers[random]
                answered = true
            }
            
            
        }
        if(answered == false){
            var random: Int = Int.random(in: 0..<5)
            output += outputAnswers[random]
        }
        return output
    }
    func getInputStrings() -> [String] {
        return inputArr
    }
    func getOutputStrings() -> [String] {
        return outputArr
    }
}
