//
//  ViewController.swift
//  UIKitCards
//
//  Created by Joshua Eres on 1/23/24.
//

import UIKit

class ViewController: UIViewController {
    var myModel=UIKitCardsModel()
    
    

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBAction func showQuestion(_ sender:Any){
        
        print("Somebody selecterd a button")
        
        answerLabel.text="????"
        questionLabel.text=myModel.getNextQuestion()
    }
    @IBAction func showAnswer(_ sender:Any){
        print("Somebody selecterd a button")
        answerLabel.text=myModel.getAnswer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

