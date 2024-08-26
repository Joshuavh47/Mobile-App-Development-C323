// C323 Mobile App Development - Mitja Hmeljak Spring 2024
//
//  starter code for Homework 04
//
//  by Evan Japundza on 2/1/24.
//

import SwiftUI

struct ContentView: View {
    
    // TODO: instantiate model object:
    //
    let myModel = Guess3LettersModel()
    
    // TODO:  define all variables for text displayed on the screen
    //        (these will be equivalent to the @IBOutlets made in UIKit).
    //        These need to be declared with the "@State" property
    //        wrapper, to ensure the view refreshes on change:
    // @State var

    @State var guessLabel1: String = "a"
    @State var guessLabel2: String = "a"
    @State var guessLabel3: String = "a"
    @State var answerLabel1: String = "?"
    @State var answerLabel2: String = "?"
    @State var answerLabel3: String = "?"
    @State var fastestGame: Int
    @State var ansColor1: Color = .yellow
    @State var ansColor2: Color = .yellow
    @State var ansColor3: Color = .yellow
    @State var wordIndex: Int
    @State var attemptsThisGame: Int
    @State var correctLastAttempt: Int
    @State var lastAttempt: String = ""
    
    init(){
        self.myModel.startGame()
        self.wordIndex = myModel.lCurrentWordIndex ?? 0
        self.fastestGame = myModel.fastestGameSoFar
        self.attemptsThisGame = myModel.attemptsThisGame
        self.correctLastAttempt = myModel.correctLastAttempt
        print(myModel.words[wordIndex])
    }
    
    
    var body: some View {
        
        // TODO: Contain all the view elements within a stack
        //       (and stacks may be nested). This VStack is the
        //       top-level, and will contain all UI elements for this
        //       "screen/window" view.
        Color("BackgroundColor").ignoresSafeArea().overlay(
        VStack {
            
            // TODO: Display game title
            Text("Guess Three Letters").padding(.bottom, 20).padding(.top)
            
            // TODO: Display Result Letters.
            //       Add view modifiers for appropriate style, positioning, etc.
            HStack{
                Text(answerLabel1).frame(width: 70, height: 70).background(ansColor1).font(.system(size: 50))
                Text(answerLabel2).frame(width: 70, height: 70).background(ansColor2).font(.system(size: 50)).padding(.horizontal, 20)
                Text(answerLabel3).frame(width: 70, height: 70).background(ansColor3).font(.system(size: 50))
            }.padding(.bottom, 25)
            
            // TODO: Display fastest game
            if(fastestGame < Int.max){
                Text("Fastest game: "+String(fastestGame)).padding(.bottom, 25)
            }
            else{
                Text("Fastest game: No games played").padding(.bottom, 25)
            }
            // TODO: Create Start Game button.
            //       Buttons will need an action closure, and a label closure,
            //       as shown in the outline here:
            Button(action: {
                /// TODO: set color for all three result letters:
                ansColor1 = .yellow
                ansColor2 = .yellow
                ansColor3 = .yellow
                /// TODO: initialize text in three result letter variables:
                answerLabel1 = "?"
                answerLabel2 = "?"
                answerLabel3 = "?"
                /// TODO: initialize text in three guess letter variables:
                guessLabel1 = "a"
                guessLabel2 = "a"
                guessLabel3 = "a"
                /// TODO: ask model to start a new game:
                myModel.startGame()
                lastAttempt = ""
                attemptsThisGame = myModel.attemptsThisGame
                correctLastAttempt = 0
            }, label: {
                Text("Start a new game").font(.system(size: 20)).foregroundColor(.white)
            }).frame(width: 200, height: 50).background(.purple).padding(.bottom, 20)
            
            // TODO: Display Number of Attempts
            Text("Attempts this game: "+String(attemptsThisGame)).padding(.bottom)
            // TODO: Display correct letters in last attempt
            Text("Correct last attempt: "+String(correctLastAttempt)).padding(.bottom)
            // TODO: Display last attempt
            Text("Last attempt: "+lastAttempt).padding(.bottom)
            // TODO: Display Guess letters, with respective "+" and "-"
            //       buttons for changing the letters
            
            // Here is an example for the first "+" button:
            HStack{
                VStack{
                    Button(action: {
                        // if it's not already the last letter, go to next letter:
                        if(guessLabel1 != "z"){
                            guessLabel1 = String(UnicodeScalar(guessLabel1.unicodeScalars.first!.value + 1)!)
                            
                        }
                    }, label: {
                        Text("+").foregroundColor(.black).frame(width:25, height:25)
                    }).background(.yellow)
                    Text(guessLabel1).frame(width: 25, height: 25)
                    Button(action: {
                        // if it's not already the last letter, go to next letter:
                        if(guessLabel1 != "a"){
                            guessLabel1 = String(UnicodeScalar(guessLabel1.unicodeScalars.first!.value - 1)!)
                            
                        }
                    }, label: {
                        Text("-").foregroundColor(.black).frame(width:25, height:25)
                    }).background(.yellow)
                }
                
                VStack{
                    Button(action: {
                        // if it's not already the last letter, go to next letter:
                        if(guessLabel2 != "z"){
                            guessLabel2 = String(UnicodeScalar(guessLabel2.unicodeScalars.first!.value + 1)!)
                            
                        }
                    }, label: {
                        Text("+").foregroundColor(.black).frame(width:25, height:25)
                    }).background(.yellow)
                    Text(guessLabel2).frame(width: 25, height: 25)
                    Button(action: {
                        // if it's not already the last letter, go to next letter:
                        if(guessLabel2 != "a"){
                            guessLabel2 = String(UnicodeScalar(guessLabel2.unicodeScalars.first!.value - 1)!)
                            
                        }
                    }, label: {
                        Text("-").foregroundColor(.black).frame(width:25, height:25)
                    }).background(.yellow)
                }.padding(.horizontal,40)
                
                VStack{
                    Button(action: {
                        // if it's not already the last letter, go to next letter:
                        if(guessLabel3 != "z"){
                            guessLabel3 = String(UnicodeScalar(guessLabel3.unicodeScalars.first!.value + 1)!)
                            
                        }
                    }, label: {
                        Text("+").foregroundColor(.black).frame(width:25, height:25)
                    }).background(.yellow)
                    Text(guessLabel3).frame(width: 25, height: 25)
                    Button(action: {
                        // if it's not already the last letter, go to next letter:
                        if(guessLabel3 != "a"){
                            guessLabel3 = String(UnicodeScalar(guessLabel3.unicodeScalars.first!.value - 1)!)
                            
                        }
                    }, label: {
                        Text("-").foregroundColor(.black).frame(width:25, height:25)
                    }).background(.yellow)
                }
            }.padding(.bottom).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            // TODO:
            // Refer to your own solution to Homework01,
            //   (not somebody else's solution)
            //   to see which adjustments are needed for the "-" button,
            //   then add the other "+" and "-" buttons.



            // TODO: Create a button to guess
            Button(action: {
                var lGuessedCorrectly: [Bool] = [false,false,false]
                
                // TODO: obtain text from each one of the three guess letter variables,
                //       then concatenate into a string.
                // text concatenated using nil-coalescing operator:
                var guess: String = guessLabel1+guessLabel2+guessLabel3
                // TODO: ask model to process the input:
                lGuessedCorrectly = myModel.processGuess(pGuess: guess)
                // TODO: update all information in corresponding labels,
                //       as from results in the model,
                //       e.g. number of attempts so far, etc.:
                correctLastAttempt = 0
                attemptsThisGame += 1
                // TODO: check results for each letter in string,
                //       and update text for each correctly guessed letter variable

                   if(lGuessedCorrectly[0]){
                       ansColor1 = .green
                       answerLabel1 = guessLabel1
                       correctLastAttempt += 1
                   }
                   if(lGuessedCorrectly[1]){
                       ansColor2 = .green
                       answerLabel2 = guessLabel2
                       correctLastAttempt += 1
                   }
                   if(lGuessedCorrectly[2]){
                       ansColor3 = .green
                       answerLabel3 = guessLabel3
                       correctLastAttempt += 1
                   }
                // TODO: check if current guess is fully correct, stop
                //       the game if so, and update variable showing
                //       fastest game so far so far:
                
                if(correctLastAttempt == 3 && attemptsThisGame < fastestGame){
                    fastestGame = attemptsThisGame
                }

            }, label: {
                Text("Guess!").foregroundColor(.white)
            }).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50).background(.purple)
            
        
            // Push the top-level VStack to the top of the screen,
            // rather than the default center:
            Spacer()
        })
    }
}

#Preview {
    ContentView()
}
