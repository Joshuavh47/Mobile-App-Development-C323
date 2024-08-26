// C323 Mobile App Development - Mitja Hmeljak Spring 2024
//
//  starter code for Homework 01
//

import UIKit

class ViewController: UIViewController {
    var myModel=ThreeLettersModel()
    
    var numOfGuesses: Int = 0
    var maxNumOfGuesses: Int = -1
    
    
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
    @IBOutlet weak var guessButtonLabel: UIButton!
    @IBOutlet weak var gameOnLabel: UILabel!
    
    // TODO:  implement IBAction for Start New Game button:
    @IBAction func startGameButton(_ sender: Any) {
        numOfGuesses = 0
        answerLabel1.text = "?"
        answerLabel2.text = "?"
        answerLabel3.text = "?"
        guessLabel1.text = "a"
        guessLabel2.text = "a"
        guessLabel3.text = "a"
        let myDefaults = UserDefaults.standard
        if(myDefaults.bool(forKey: "darkModeKey")){
            self.view.backgroundColor = UIColor.gray
            self.answerLabel1.backgroundColor = UIColor.purple
            self.answerLabel2.backgroundColor = UIColor.purple
            self.answerLabel3.backgroundColor = UIColor.purple
            self.guessLabel1.backgroundColor = UIColor.purple
            self.guessLabel2.backgroundColor = UIColor.purple
            self.guessLabel3.backgroundColor = UIColor.purple
            self.guessButtonLabel.backgroundColor = UIColor.purple
        }
        else{
            self.view.backgroundColor = UIColor(named: "Light Background")
            self.answerLabel1.backgroundColor = UIColor.systemYellow
            self.answerLabel2.backgroundColor = UIColor.systemYellow
            self.answerLabel3.backgroundColor = UIColor.systemYellow
            self.guessLabel1.backgroundColor = UIColor.systemGreen
            self.guessLabel2.backgroundColor = UIColor.systemGreen
            self.guessLabel3.backgroundColor = UIColor.systemGreen
            self.guessButtonLabel.backgroundColor = UIColor(named: "GuessButton")
        }
        
        if(myModel.fastestGameSoFar != Int.max){
            fastestGameLabel.text = "Fastest Game: \(myModel.fastestGameSoFar) Attempts"
        }
        else{
            fastestGameLabel.text = "No previous completions"
        }
        correctLettersLabel.text = "0"
        attemptsThisGameLabel.text = "0"
        lastGuessLabel.text=" "
        myModel.startGame()
        gameOnLabel.text = "Game is on"
        
    } // end of startGameButton

    // TODO: implement IBAction for Guess button:
    @IBAction func guessButton(_ sender: Any) {
        if(myModel.gameIsOn){
            numOfGuesses+=1
            var guess:String = guessLabel1.text! + guessLabel2.text! + guessLabel3.text!
            lastGuessLabel.text = guess
            var correctness: [Bool] = myModel.processGuess(pGuess: guess)
            attemptsThisGameLabel.text = String(myModel.attemptsThisGame)
            print(myModel.words[myModel.lCurrentWordIndex!])
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
            correctLettersLabel.text = String(myModel.correctLastAttempt)
            if(correctness[0] == true && correctness[1] == true && correctness[2] == true){
                answerLabel1.backgroundColor=UIColor.systemGreen
                answerLabel2.backgroundColor=UIColor.systemGreen
                answerLabel3.backgroundColor=UIColor.systemGreen
                
                fastestGameLabel.text = "Fastest Game: \(myModel.fastestGameSoFar) Attempts"
                myModel.stopGame()
                gameOnLabel.text = "You win! Start a new game!"
                return
            }
            if(numOfGuesses>=maxNumOfGuesses){
                myModel.stopGame()
                gameOnLabel.text = "You Lose! Start a new game!"
            }
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
        
        if(guessLabel1.text != "z" && myModel.gameIsOn){
            guessLabel1.text = String(UnicodeScalar(guessLabel1.text!.unicodeScalars.first!.value + 1)!)
            
        }
        
        
        
    }
    
    @IBAction func plus2(_ sender:Any){
        
        if(guessLabel2.text != "z" && myModel.gameIsOn){
            guessLabel2.text = String(UnicodeScalar(guessLabel2.text!.unicodeScalars.first!.value + 1)!)
            
        }
        
        
        
    }
    
    @IBAction func plus3(_ sender:Any){
        
        if(guessLabel3.text != "z" && myModel.gameIsOn){
            guessLabel3.text = String(UnicodeScalar(guessLabel3.text!.unicodeScalars.first!.value + 1)!)
            
        }
        
        
        
    }
    
    @IBAction func minus1(_ sender:Any){
        
        if(guessLabel1.text != "a" && myModel.gameIsOn){
            guessLabel1.text = String(UnicodeScalar(guessLabel1.text!.unicodeScalars.first!.value - 1)!)
            
        }
        
        
        
    }
    
    @IBAction func minus2(_ sender:Any){
        
        if(guessLabel2.text != "a" && myModel.gameIsOn){
            guessLabel2.text = String(UnicodeScalar(guessLabel2.text!.unicodeScalars.first!.value - 1)!)
            
        }
        
        
        
    }
    
    @IBAction func minus3(_ sender:Any){
        
        if(guessLabel3.text != "a" && myModel.gameIsOn){
            guessLabel3.text = String(UnicodeScalar(guessLabel3.text!.unicodeScalars.first!.value - 1)!)
            
        }
        
        
        
    }

    




//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let myDefaults = UserDefaults.standard
//        if(myDefaults.bool(forKey: "darkModeKey")){
//            self.view.backgroundColor = UIColor.gray
//            self.answerLabel1.backgroundColor = UIColor.purple
//            self.answerLabel2.backgroundColor = UIColor.purple
//            self.answerLabel3.backgroundColor = UIColor.purple
//            self.guessLabel1.backgroundColor = UIColor.purple
//            self.guessLabel2.backgroundColor = UIColor.purple
//            self.guessLabel3.backgroundColor = UIColor.purple
//            self.guessButtonLabel.backgroundColor = UIColor.purple
//        }
//        if(myDefaults.integer(forKey: "guessesKey")>0){
//            maxNumOfGuesses = myDefaults.integer(forKey: "guessesKey")
//        }
//        else{
//            maxNumOfGuesses = Int.max
//        }
//        myModel.startGame()
//        gameOnLabel.text = "Game is on"
//        // Do any additional setup after loading the view.
//    } // end of func viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        nc.addObserver(self, selector: #selector(appMovedToForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc func appMovedToBackground() {
        print("moved to background")
    }

    @objc func appMovedToForeground() {
        let myDefaults = UserDefaults.standard
        myModel.startGame()
        gameOnLabel.text = "Game is on"
        if(myDefaults.bool(forKey: "darkModeKey")){
            self.view.backgroundColor = UIColor.gray
            self.answerLabel1.backgroundColor = UIColor.purple
            self.answerLabel2.backgroundColor = UIColor.purple
            self.answerLabel3.backgroundColor = UIColor.purple
            self.guessLabel1.backgroundColor = UIColor.purple
            self.guessLabel2.backgroundColor = UIColor.purple
            self.guessLabel3.backgroundColor = UIColor.purple
            self.guessButtonLabel.backgroundColor = UIColor.purple
        }
        else{
            self.view.backgroundColor = UIColor(named: "Light Background")
            self.answerLabel1.backgroundColor = UIColor.systemYellow
            self.answerLabel2.backgroundColor = UIColor.systemYellow
            self.answerLabel3.backgroundColor = UIColor.systemYellow
            self.guessLabel1.backgroundColor = UIColor.systemGreen
            self.guessLabel2.backgroundColor = UIColor.systemGreen
            self.guessLabel3.backgroundColor = UIColor.systemGreen
            self.guessButtonLabel.backgroundColor = UIColor(named: "GuessButton")
        }
        if(myDefaults.integer(forKey: "guessesKey")>0){
            maxNumOfGuesses = myDefaults.integer(forKey: "guessesKey")
            if(numOfGuesses>=maxNumOfGuesses){
                myModel.stopGame()
                gameOnLabel.text = "You Lose! Start a new game!"
            }
        }
        
        else{
            maxNumOfGuesses = Int.max
        }
        print("moved to foreground")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let myDefaults = UserDefaults.standard
        myModel.startGame()
        gameOnLabel.text = "Game is on"
        if(myDefaults.bool(forKey: "darkModeKey")){
            self.view.backgroundColor = UIColor.gray
            self.answerLabel1.backgroundColor = UIColor.purple
            self.answerLabel2.backgroundColor = UIColor.purple
            self.answerLabel3.backgroundColor = UIColor.purple
            self.guessLabel1.backgroundColor = UIColor.purple
            self.guessLabel2.backgroundColor = UIColor.purple
            self.guessLabel3.backgroundColor = UIColor.purple
            self.guessButtonLabel.backgroundColor = UIColor.purple
        }
        else{
            self.view.backgroundColor = UIColor(named: "Light Background")
            self.answerLabel1.backgroundColor = UIColor.systemYellow
            self.answerLabel2.backgroundColor = UIColor.systemYellow
            self.answerLabel3.backgroundColor = UIColor.systemYellow
            self.guessLabel1.backgroundColor = UIColor.systemGreen
            self.guessLabel2.backgroundColor = UIColor.systemGreen
            self.guessLabel3.backgroundColor = UIColor.systemGreen
            self.guessButtonLabel.backgroundColor = UIColor(named: "GuessButton")
        }
        if(myDefaults.integer(forKey: "guessesKey")>0){
            maxNumOfGuesses = myDefaults.integer(forKey: "guessesKey")
            if(numOfGuesses>=maxNumOfGuesses){
                myModel.stopGame()
                gameOnLabel.text = "You Lose! Start a new game!"
            }
        }
        
        else{
            maxNumOfGuesses = Int.max
        }
        
    }
    


} // end of class ViewController: UIViewController

