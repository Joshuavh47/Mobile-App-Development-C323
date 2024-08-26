// C323 Mobile App Development - Mitja Hmeljak Spring 2024
//
//  starter code for Homework 01
//

import UIKit

class ViewController: UIViewController {
    var appDelegate:AppDelegate?
    var myModel:ThreeLettersModel?
    
    
    
    @IBOutlet weak var answerLabel1: UILabel!
    @IBOutlet weak var answerLabel2: UILabel!
    @IBOutlet weak var answerLabel3: UILabel!
    @IBOutlet weak var guessLabel1: UILabel!
    @IBOutlet weak var guessLabel2: UILabel!
    @IBOutlet weak var guessLabel3: UILabel!
    @IBOutlet weak var fastestGameLabel: UILabel!
    @IBOutlet weak var attemptsThisGameLabel: UILabel!
    @IBOutlet weak var correctLettersLabel: UILabel!
    @IBOutlet weak var lastGuessLabel: UILabel!
    
    @IBOutlet weak var allTimeLabel: UILabel!
    
    // TODO:  implement IBAction for Start New Game button:
    @IBAction func startGameButton(_ sender: Any) {
        answerLabel1.text = "?"
        answerLabel2.text = "?"
        answerLabel3.text = "?"
        guessLabel1.text = "a"
        guessLabel2.text = "a"
        guessLabel3.text = "a"
        
        answerLabel1.backgroundColor=UIColor.systemYellow
        answerLabel2.backgroundColor=UIColor.systemYellow
        answerLabel3.backgroundColor=UIColor.systemYellow
        
        if(myModel!.fastestGameSoFar != Int.max){
            fastestGameLabel.text = "Fastest Game: \(myModel!.fastestGameSoFar) Attempts"
        }
        else{
            fastestGameLabel.text = "No previous completions"
        }
        correctLettersLabel.text = "0"
        attemptsThisGameLabel.text = "0"
        lastGuessLabel.text=" "
        myModel!.startGame()
        myModel?.saveGame()
        
    } // end of startGameButton

    // TODO: implement IBAction for Guess button:
    @IBAction func guessButton(_ sender: Any) {
        
        
        var guess:String = guessLabel1.text! + guessLabel2.text! + guessLabel3.text!
        lastGuessLabel.text = guess
        var correctness: [Bool] = myModel!.processGuess(pGuess: guess)
        attemptsThisGameLabel.text = String(myModel!.attemptsThisGame)
        allTimeLabel.text = String(myModel!.allTimeScore ?? 0)
        print(myModel!.words[myModel!.lCurrentWordIndex!])
        print(correctness)
        if(correctness[0] == true){
            answerLabel1.text = guessLabel1.text
            
        }
        if(correctness[1] == true){
            answerLabel2.text = guessLabel2.text
            
        }
        if(correctness[2] == true){
            answerLabel3.text = guessLabel3.text
            
        }
        correctLettersLabel.text = String(myModel!.correctLastAttempt)
        if(correctness[0] == true && correctness[1] == true && correctness[2] == true){
            answerLabel1.backgroundColor=UIColor.systemGreen
            answerLabel2.backgroundColor=UIColor.systemGreen
            answerLabel3.backgroundColor=UIColor.systemGreen
            
            fastestGameLabel.text = "Fastest Game: \(myModel!.fastestGameSoFar) Attempts"
            myModel!.stopGame()
        }
        
        
        // TODO: obtain text from each one of the three guess letter labels,
        //       then concatenate into a string.

        // Note: labels are all optional types that may need unwrapping.

        // TODO: ask model to process the input:

        // TODO: update all information in corresponding labels,
        //       as from results in the model,
        //       e.g. number of attempts so far, etc.:

        // TODO: check results for each letter in string,
        //       and update text for each correctly guessed letter label

        // TODO: check if current guess is fully correct,
        //    in which case change background color for all result letter labels,
        //    and update label showing fastest game so far so far:

    } // end of func guessButton()


    // implemented IBAction for the first "next letter" button:
    @IBAction func plus1(_ sender:Any){
        
        if(guessLabel1.text != "z"){
            guessLabel1.text = String(UnicodeScalar(guessLabel1.text!.unicodeScalars.first!.value + 1)!)
            
        }
        
        
        
    }
    
    @IBAction func plus2(_ sender:Any){
        
        if(guessLabel2.text != "z"){
            guessLabel2.text = String(UnicodeScalar(guessLabel2.text!.unicodeScalars.first!.value + 1)!)
            
        }
        
        
        
    }
    
    @IBAction func plus3(_ sender:Any){
        
        if(guessLabel3.text != "z"){
            guessLabel3.text = String(UnicodeScalar(guessLabel3.text!.unicodeScalars.first!.value + 1)!)
            
        }
        
        
        
    }
    
    @IBAction func minus1(_ sender:Any){
        
        if(guessLabel1.text != "a"){
            guessLabel1.text = String(UnicodeScalar(guessLabel1.text!.unicodeScalars.first!.value - 1)!)
            
        }
        
        
        
    }
    
    @IBAction func minus2(_ sender:Any){
        
        if(guessLabel2.text != "a"){
            guessLabel2.text = String(UnicodeScalar(guessLabel2.text!.unicodeScalars.first!.value - 1)!)
            
        }
        
        
        
    }
    
    @IBAction func minus3(_ sender:Any){
        
        if(guessLabel3.text != "a"){
            guessLabel3.text = String(UnicodeScalar(guessLabel3.text!.unicodeScalars.first!.value - 1)!)
            
        }
        
        
        
    }

    
    func setVars(loadModel:ThreeLettersModel){
        myModel!.allTimeScore = loadModel.allTimeScore
        allTimeLabel.text = String(myModel!.allTimeScore ?? 0)
        myModel!.fastestGame = loadModel.fastestGame ?? 0
        myModel!.attemptsThisGame = loadModel.attemptsThisGame
        myModel!.lCurrentWordIndex = loadModel.lCurrentWordIndex ?? 0
        myModel!.correctLastAttempt = loadModel.correctLastAttempt
        myModel!.gameIsOn = loadModel.gameIsOn
        myModel!.fastestGameSoFar = loadModel.fastestGameSoFar
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.myModel = self.appDelegate?.theModel
        allTimeLabel.text = String(myModel!.allTimeScore ?? 0)
        attemptsThisGameLabel.text = String(myModel!.attemptsThisGame)
        correctLettersLabel.text = String(myModel?.correctLastAttempt ?? 0)
        if(myModel?.previousGuess != ""){
            if(myModel?.previousGuess[0] == myModel?.words[myModel?.lCurrentWordIndex ?? 0][0]){
                answerLabel1.text = myModel?.previousGuess[0]
            }
            if(myModel?.previousGuess[1] == myModel?.words[myModel?.lCurrentWordIndex ?? 0][1]){
                answerLabel2.text = myModel?.previousGuess[1]
            }
            if(myModel?.previousGuess[2] == myModel?.words[myModel?.lCurrentWordIndex ?? 0][2]){
                answerLabel3.text = myModel?.previousGuess[2]
            }
            lastGuessLabel.text = myModel?.previousGuess
            guessLabel1.text = myModel?.previousGuess[0]
            guessLabel2.text = myModel?.previousGuess[1]
            guessLabel3.text = myModel?.previousGuess[2]
        }
        if (myModel?.fastestGame == nil){
            myModel?.allTimeScore = 0
        }
        if(myModel?.lCurrentWordIndex == nil){
            myModel?.lCurrentWordIndex = 0
        }
        if(myModel!.fastestGameSoFar != Int.max){
            fastestGameLabel.text = "Fastest Game: \(myModel!.fastestGameSoFar) Attempts"
        }
        //myModel!.startGame()
        myModel?.gameIsOn = true
        
        // Do any additional setup after loading the view.
    } // end of func viewDidLoad()


} // end of class ViewController: UIViewController

