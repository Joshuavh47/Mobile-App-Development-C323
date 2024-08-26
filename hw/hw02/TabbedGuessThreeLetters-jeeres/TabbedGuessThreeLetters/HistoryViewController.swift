//
//  HistoryViewController.swift
//  TabbedTabbedGuessThreeLetters
//
//  Created by Joshua Eres on 2/9/24.
//

import UIKit

class HistoryViewController: UIViewController, UITextViewDelegate {
    var appDelegate: AppDelegate?
    var myModelRef:ThreeLettersModel?
    @IBOutlet weak var textViewRef: UITextView!
    
    var prevAttempt:String?
    
    override func viewDidLoad() {
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.myModelRef = self.appDelegate?.theModel
        self.textViewRef.delegate = self
        print(textViewRef.text)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.myModelRef = self.appDelegate?.theModel
        self.textViewRef.delegate = self
        if(prevAttempt != self.myModelRef?.prevAttempt){
            prevAttempt=self.myModelRef?.prevAttempt
            var correctness: [Bool] = self.myModelRef!.processGuess(pGuess: prevAttempt ?? "")
            if(correctness[0] == true && correctness[1] == true && correctness[2] == true && self.myModelRef?.guessed == true){
                textViewRef.text += "Correct: \(prevAttempt!) Attempts: \(self.myModelRef?.attemptsThisGame ?? 0)\n"
            }
            else if((correctness[0] != true || correctness[1] != true || correctness[2] != true) && self.myModelRef?.guessed == true){
                textViewRef.text += "Incorrect: \(prevAttempt!) Attempts so far: \(self.myModelRef?.attemptsThisGame ?? 0)\n"
            }
            
        }
        self.myModelRef?.guessed = false
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
