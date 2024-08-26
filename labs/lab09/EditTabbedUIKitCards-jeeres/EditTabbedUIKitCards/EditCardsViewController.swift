//
//  EditCardsViewController.swift
//  EditTabbedUIKitCards
//
//  Created by Joshua Eres on 2/7/24.
//

import UIKit

class EditCardsViewController: UIViewController, UITextFieldDelegate {
    var appDelegate:AppDelegate?
    var myModelRef:EditTabbedUIKitCardsModel?
    
    @IBOutlet weak var theEditQandATextField: UITextField!
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.theEditQandATextField.delegate = self
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
