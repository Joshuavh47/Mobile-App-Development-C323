//
//  HistoryViewController.swift
//  Ipsum
//
//  Created by Joshua Eres on 2/15/24.
//

import UIKit

class HistoryViewController: UIViewController, UITextViewDelegate {

    var appDelegate:AppDelegate?
    var myModelRef:Ipsum?
    @IBOutlet weak var historyTextView: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        historyTextView.text = ""
        var inputStrings: [String] = self.myModelRef?.getInputStrings() ?? []
        var outputStrings: [String] = self.myModelRef?.getOutputStrings() ?? []
        
        if(self.myModelRef?.inputArr.count ?? 0 > 0){
            for i in 0...inputStrings.count-1 {
                historyTextView.text += "User: \(inputStrings[i] ?? " ")\nIpsum: \(outputStrings[i] ?? " ")\n"
            }
        }
    }
    
    override func viewDidLoad() {
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.myModelRef = self.appDelegate?.theModel
        self.historyTextView.delegate = self
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
