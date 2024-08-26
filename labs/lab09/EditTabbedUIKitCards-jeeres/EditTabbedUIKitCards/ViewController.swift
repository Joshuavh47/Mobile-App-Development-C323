//
//  ViewController.swift
//  EditTabbedUIKitCards
//
//  Created by Joshua Eres on 1/23/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //var myModel=EditTabbedUIKitCardsModel()
    var appDelegate:AppDelegate?
    var myModelRef:EditTabbedUIKitCardsModel?
    
    
    

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBAction func showQuestion(_ sender:Any){
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.myModelRef = self.appDelegate?.theModel
        print("Somebody selecterd a button")
        
        answerLabel.text="????"
        questionLabel.text=self.myModelRef!.getNextQuestion()
    }
    @IBAction func showAnswer(_ sender:Any){
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.myModelRef = self.appDelegate?.theModel
        print("Somebody selecterd a button")
        answerLabel.text=self.myModelRef!.getAnswer()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}


