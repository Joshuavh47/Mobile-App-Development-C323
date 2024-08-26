//
//  ViewController.swift
//  UIKitCards
//
//  Created by Joshua Eres on 1/23/24.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    var myModel=UIKitCardsModel()
    
    

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBAction func showQuestion(_ sender:Any){
        
        print("Somebody selecterd a button")
        
        answerLabel.text="????"
        questionLabel.text=myModel.getNextQuestion()
    }
    @IBAction func showAnswer(_ sender:Any){
        print("Somebody selecterd a button")
        answerLabel.text=myModel.getAnswer()
    }
    
    func refreshSettings(){
        let myDefaults = UserDefaults.standard
        sliderLabel.text = myDefaults.string(forKey: "test")
        print(myDefaults.string(forKey: "test"))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshSettings()
        // Do any additional setup after loading the view.
    }


    
    
}

