//
//  ViewController.swift
//  Ipsum
//
//  Created by Vedaant Modi on 2/13/24.
//

import UIKit

class InteractionViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    var appDelegate:AppDelegate?
    var myModelRef:Ipsum?
    
    
    @IBOutlet weak var ipsumTextField: UITextField!
    @IBOutlet weak var ipsumTextView: UITextView!
    
    @IBAction func submitText(_ sender:Any){
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.myModelRef = self.appDelegate?.theModel
        ipsumTextView.text! += "User: \(ipsumTextField.text ?? " ")\nIpsum: \(self.myModelRef!.oneInteraction(input: ipsumTextField.text ?? " "))\n"
        ipsumTextField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.myModelRef = self.appDelegate?.theModel
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        self.ipsumTextField.delegate = self
        self.ipsumTextView.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

